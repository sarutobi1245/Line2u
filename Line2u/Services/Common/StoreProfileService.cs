﻿using AutoMapper;
using AutoMapper.QueryableExtensions;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.EntityFrameworkCore;
using NetUtility;
using Line2u.Constants;
using Line2u.Data;
using Line2u.DTO;
using Line2u.Helpers;
using Line2u.Models;
using Line2u.Services.Base;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Threading.Tasks;
using Syncfusion.JavaScript;
using Syncfusion.JavaScript.DataSources;
using Microsoft.Data.SqlClient;
using System.Data;
using Microsoft.Extensions.Configuration;
using Dapper;
using isRock.LineBot;
using static Microsoft.Extensions.Logging.EventSource.LoggingEventSource;

namespace Line2u.Services
{
    public interface IStoreProfileService : IServiceBase<StoreProfile, StoreProfilesDto>
    {
        Task<OperationResult> AddFormAsync(StoreProfilesDto model);
        Task<OperationResult> UpdateFormAsync(StoreProfilesDto model);
        Task<OperationResult> UpdateFormMobileAsync(StoreProfilesDto model);
        Task<object> DeleteUploadFile(decimal key);
        Task<object> GetByIDWithGuidAsync(string guid);
        Task<object> GetInforByStoreName(string name);
        Task<object> GetAll();

        Task<object> UploadAvatarForMobile(IFormFile file, decimal key);


    }
    public class StoreProfileService : ServiceBase<StoreProfile, StoreProfilesDto>, IStoreProfileService
    {
        private readonly ISPService _repoSp;
        private readonly IRepositoryBase<StoreProfile> _repo;
        private readonly IRepositoryBase<CodeType> _repoCodeType;
        private readonly IRepositoryBase<XAccountPermission> _repoXAccountPermission;
        private readonly IRepositoryBase<XAccountGroupPermission> _repoXAccountGroupPermission;
        private readonly IRepositoryBase<CodePermission> _repoCodePermission;
        private readonly IRepositoryBase<Employee> _repoEmployee;
        private readonly IRepositoryBase<XAccountGroup> _repoXAccountGroup;
        private readonly ISequenceService _sequenceService;
        private readonly IUnitOfWork _unitOfWork;
        private readonly IMapper _mapper;
        private readonly MapperConfiguration _configMapper;
        private readonly ILine2uLoggerService _logger;
        private readonly IHttpContextAccessor _httpContextAccessor;
        private readonly IWebHostEnvironment _currentEnvironment;
        private readonly IConfiguration _configuration;

        public StoreProfileService(
            IRepositoryBase<StoreProfile> repo,
            IRepositoryBase<CodeType> repoCodeType,
            IRepositoryBase<XAccountPermission> repoXAccountPermission,
            IRepositoryBase<XAccountGroupPermission> repoXAccountGroupPermission,
            IRepositoryBase<CodePermission> repoCodePermission,
            IRepositoryBase<Employee> repoEmployee,
            IRepositoryBase<XAccountGroup> repoXAccountGroup,
            ISequenceService sequenceService,
            IUnitOfWork unitOfWork,
            IMapper mapper,
            MapperConfiguration configMapper,
            ILine2uLoggerService logger,
            IHttpContextAccessor httpContextAccessor,
            IWebHostEnvironment currentEnvironment,
            IConfiguration configuration
    ,
            ISPService repoSp
            )
            : base(repo, logger, unitOfWork, mapper, configMapper)
        {
            _repo = repo;
            _repoCodeType = repoCodeType;
            _repoXAccountPermission = repoXAccountPermission;
            _repoXAccountGroupPermission = repoXAccountGroupPermission;
            _repoCodePermission = repoCodePermission;
            _repoEmployee = repoEmployee;
            _repoXAccountGroup = repoXAccountGroup;
            _sequenceService = sequenceService;
            _logger = logger;
            _unitOfWork = unitOfWork;
            _mapper = mapper;
            _configMapper = configMapper;
            _httpContextAccessor = httpContextAccessor;
            _currentEnvironment = currentEnvironment;
            _configuration = configuration;
            _repoSp = repoSp;
        }

       
       

       

        public async Task<object> UploadAvatarForMobile(IFormFile file, decimal key)
        {
            IFormFile filesAvatar = file;
            var Current = _httpContextAccessor.HttpContext;
            var url = $"{Current.Request.Scheme}://{Current.Request.Host}{Current.Request.PathBase}";
            var item = await _repo.FindAll(x => x.Id == key).FirstOrDefaultAsync();
            if (item == null)
            {
                return new OperationResult { StatusCode = HttpStatusCode.NotFound, Message = "Not Found!", Success = false };
            }

            FileExtension fileExtension = new FileExtension();

            // Nếu có đổi ảnh thì xóa ảnh cũ và thêm ảnh mới
            var avatarUniqueFileName = string.Empty;
            var avatarFolderPath = "FileUploads\\images\\product\\avatar";
            string uploadAvatarFolder = Path.Combine(_currentEnvironment.WebRootPath, avatarFolderPath);

            if (filesAvatar != null)
            {
                if (!item.PhotoPath.IsNullOrEmpty())
                    fileExtension.Remove($"{_currentEnvironment.WebRootPath}{item.PhotoPath.Replace("/", "\\").Replace("/", "\\")}");
                avatarUniqueFileName = await fileExtension.WriteAsync(filesAvatar, $"{uploadAvatarFolder}\\{avatarUniqueFileName}");
                item.PhotoPath = $"/FileUploads/images/product/avatar/{avatarUniqueFileName}";
            }

            try
            {
                _repo.Update(item);
                await _unitOfWork.SaveChangeAsync();
                FileInfo info = new FileInfo($"{url}{item.PhotoPath}");
                return new
                {
                    initialPreview = $"<img src='{url}{item.PhotoPath}' class='file-preview-image' alt='img' title='img'>",
                    initialPreviewConfig = new List<dynamic> {
                    new
                    {
                        caption = "",
                        url= $"{url}/api/XAccount/DeleteUploadFile", // server delete action 
                        key= key
                    }
                },
                    append = true
                };
            }
            catch (Exception ex)
            {
                await _logger.LogStoreProcedure(new LoggerParams
                {
                    Type = Line2uLogConst.Update,
                    LogText = $"Type: {ex.GetType().Name}, Message: {ex.Message}, StackTrace: {ex.ToString()}"
                }).ConfigureAwait(false);

                // Nếu tạo ra file rồi mã lưu db bị lỗi thì xóa file vừa tạo đi
                if (!avatarUniqueFileName.IsNullOrEmpty())
                    fileExtension.Remove($"{uploadAvatarFolder}\\{avatarUniqueFileName}");

                // Không thêm được thì xóa file vừa tạo đi
                return new List<dynamic>
                    {
                    new {
                        error = "No file found"

                        }
                    };
            }
        }
        public async Task<OperationResult> AddFormAsync(StoreProfilesDto model)
        {
            FileExtension fileExtension = new FileExtension();
            var avatarUniqueFileName = string.Empty;
            var avatarFolderPath = "FileUploads\\images\\store\\avatar";
            string uploadAvatarFolder = Path.Combine(_currentEnvironment.WebRootPath, avatarFolderPath);
            if (model.File != null)
            {
                IFormFile files = model.File.FirstOrDefault();
                if (!files.IsNullOrEmpty())
                {
                    avatarUniqueFileName = await fileExtension.WriteAsync(files, $"{uploadAvatarFolder}\\{avatarUniqueFileName}");
                    model.PhotoPath = $"/FileUploads/images/store/avatar/{avatarUniqueFileName}";
                }
            }
            try
            {
                var item = _mapper.Map<StoreProfile>(model);
                item.Guid = Guid.NewGuid().ToString("N") + DateTime.Now.ToString("ssff");
                item.StoreOpenTime = model.StoreOpenTime;
                item.StoreCloseTime = model.StoreCloseTime;
                item.Status = 1;
                _repo.Add(item);
                await _unitOfWork.SaveChangeAsync();

                operationResult = new OperationResult
                {
                    StatusCode = HttpStatusCode.OK,
                    Message = MessageReponse.AddSuccess,
                    Success = true,
                    Data = model
                };
            }
            catch (Exception ex)
            {
                await _logger.LogStoreProcedure(new LoggerParams
                {
                    Type = Line2uLogConst.Create,
                    LogText = $"Type: {ex.GetType().Name}, Message: {ex.Message}, StackTrace: {ex.ToString()}"
                }).ConfigureAwait(false);
                if (!avatarUniqueFileName.IsNullOrEmpty())
                    fileExtension.Remove($"{uploadAvatarFolder}\\{avatarUniqueFileName}");

                operationResult = ex.GetMessageError();
            }
            return operationResult;
        }

        public async Task<OperationResult> UpdateFormAsync(StoreProfilesDto model)
        {

            FileExtension fileExtension = new FileExtension();
            var itemModel = await _repo.FindAll(x => x.AccountGuid == model.Guid).AsNoTracking().FirstOrDefaultAsync();
           
                itemModel = await _repo.FindAll(x => x.AccountGuid == model.Guid).FirstOrDefaultAsync();
            var item = _mapper.Map<StoreProfile>(itemModel);
            

            // Nếu có đổi ảnh thì xóa ảnh cũ và thêm ảnh mới
            var avatarUniqueFileName = string.Empty;
            var avatarFolderPath = "FileUploads\\images\\store\\avatar";
            string uploadAvatarFolder = Path.Combine(_currentEnvironment.WebRootPath, avatarFolderPath);

            if (model.File != null)
            {
                IFormFile filesAvatar = model.File.FirstOrDefault();
                if (!filesAvatar.IsNullOrEmpty())
                {
                    if (!item.PhotoPath.IsNullOrEmpty())
                        fileExtension.Remove($"{_currentEnvironment.WebRootPath}{item.PhotoPath.Replace("/", "\\").Replace("/", "\\")}");
                    avatarUniqueFileName = await fileExtension.WriteAsync(filesAvatar, $"{uploadAvatarFolder}\\{avatarUniqueFileName}");
                    item.PhotoPath = $"/FileUploads/images/store/avatar/{avatarUniqueFileName}";
                }
            }




            try
            {
                
                //item.LineID = model.LineID;
                //item.AccountNo = model.AccountNo;
                //item.AccountName = model.AccountName;
                //item.LineID = model.LineID;
                //item.LineName = model.LineName;
                //item.LinePicture = model.LinePicture;
                //item.IsLineAccount = model.IsLineAccount;
                _repo.Update(item);
                await _unitOfWork.SaveChangeAsync();

                operationResult = new OperationResult
                {
                    StatusCode = HttpStatusCode.OK,
                    Message = MessageReponse.UpdateSuccess,
                    Success = true,
                    Data = model
                };
            }
            catch (Exception ex)
            {
                await _logger.LogStoreProcedure(new LoggerParams
                {
                    Type = Line2uLogConst.Update,
                    LogText = $"Type: {ex.GetType().Name}, Message: {ex.Message}, StackTrace: {ex.ToString()}"
                }).ConfigureAwait(false);
                // Nếu tạo ra file rồi mã lưu db bị lỗi thì xóa file vừa tạo đi
                if (!avatarUniqueFileName.IsNullOrEmpty())
                    fileExtension.Remove($"{uploadAvatarFolder}\\{avatarUniqueFileName}");

                operationResult = ex.GetMessageError();
            }
            return operationResult;
        }

        public async Task<object> DeleteUploadFile(decimal key)
        {
            try
            {
                var item = await _repo.FindByIDAsync(key);
                if (item != null)
                {
                    string uploadAvatarFolder = Path.Combine(_currentEnvironment.WebRootPath, item.PhotoPath);
                    FileExtension fileExtension = new FileExtension();
                    var avatarUniqueFileName = item.PhotoPath;
                    if (!avatarUniqueFileName.IsNullOrEmpty())
                    {
                        var result = fileExtension.Remove($"{_currentEnvironment.WebRootPath}\\{item.PhotoPath}");
                        if (result)
                        {
                            item.PhotoPath = string.Empty;
                            _repo.Update(item);
                            await _unitOfWork.SaveChangeAsync();
                        }
                    }
                }


                return new { status = true };
            }
            catch (Exception ex)
            {
                await _logger.LogStoreProcedure(new LoggerParams
                {
                    Type = Line2uLogConst.Delete,
                    LogText = $"Type: {ex.GetType().Name}, Message: {ex.Message}, StackTrace: {ex.ToString()}"
                }).ConfigureAwait(false);
                return new { status = true };
            }
        }

        
        private async Task LogStoreProcedure(decimal accountId, string logText)
        {
            using (SqlConnection conn = new SqlConnection(_configuration.GetConnectionString("DefaultConnection")))
            {
                if (conn.State == ConnectionState.Closed)
                {
                    await conn.OpenAsync();
                }
                var Context = _httpContextAccessor.HttpContext;
                var url = string.Format("{0}://{1}{2}{3}", Context.Request.Scheme, Context.Request.Host, Context.Request.Path, Context.Request.QueryString);
                var remoteIpAddress = Context.Connection.RemoteIpAddress.ToString();
                string sql = "SP_Save_SYS_LOG";
                var parameters = new
                {
                    @LOG_Type = "",
                    @LOG_TEXT = logText,
                    @Account_ID = accountId,
                    @LOG_IP = remoteIpAddress,
                    @LOG_WIP = "",
                    @LOG_URL = url,
                };
                try
                {
                    await conn.QueryAsync(sql, parameters, commandType: CommandType.StoredProcedure);
                }
                catch
                {
                }

            }
        }
      

       

        public async Task<object> GetProfileMobile(string key)
        {
            var query = from x in _repo.FindAll(x => x.Status == 1 && x.Guid == key)
                        select new
                        {
                            AccountGuid = x.Guid,
                            x.PhotoPath,
                        };
            return await query.FirstOrDefaultAsync();
        }

        public async Task<OperationResult> UpdateFormMobileAsync(StoreProfilesDto model)
        {
            FileExtension fileExtension = new FileExtension();
            var itemModel = await _repo.FindAll(x => x.Guid == model.Guid).AsNoTracking().FirstOrDefaultAsync();
            var item = _mapper.Map<StoreProfile>(itemModel);
          

            // Nếu có đổi ảnh thì xóa ảnh cũ và thêm ảnh mới
            var avatarUniqueFileName = string.Empty;
            var avatarFolderPath = "FileUploads\\images\\store\\avatar";
            string uploadAvatarFolder = Path.Combine(_currentEnvironment.WebRootPath, avatarFolderPath);

            if (model.File != null)
            {
                IFormFile filesAvatar = model.File.FirstOrDefault();
                if (!filesAvatar.IsNullOrEmpty())
                {
                    if (!item.PhotoPath.IsNullOrEmpty())
                        fileExtension.Remove($"{_currentEnvironment.WebRootPath}{item.PhotoPath.Replace("/", "\\").Replace("/", "\\")}");
                    avatarUniqueFileName = await fileExtension.WriteAsync(filesAvatar, $"{uploadAvatarFolder}\\{avatarUniqueFileName}");
                    item.PhotoPath = $"/FileUploads/images/store/avatar/{avatarUniqueFileName}";
                }
            }




            try
            {

                item.StoreOpenTime = model.StoreOpenTime;
                item.StoreName = model.StoreName;
                item.StoreAddress = model.StoreAddress;
                item.StoreCloseTime= model.StoreCloseTime;
                item.StoreLowPrice = model.StoreLowPrice;
                item.StoreHightPrice = model.StoreHightPrice;
                _repo.Update(item);
                await _unitOfWork.SaveChangeAsync();

                operationResult = new OperationResult
                {
                    StatusCode = HttpStatusCode.OK,
                    Message = MessageReponse.UpdateSuccess,
                    Success = true,
                    Data = model
                };
            }
            catch (Exception ex)
            {
                await _logger.LogStoreProcedure(new LoggerParams
                {
                    Type = Line2uLogConst.Update,
                    LogText = $"Type: {ex.GetType().Name}, Message: {ex.Message}, StackTrace: {ex.ToString()}"
                }).ConfigureAwait(false);
                // Nếu tạo ra file rồi mã lưu db bị lỗi thì xóa file vừa tạo đi
                if (!avatarUniqueFileName.IsNullOrEmpty())
                    fileExtension.Remove($"{uploadAvatarFolder}\\{avatarUniqueFileName}");

                operationResult = ex.GetMessageError();
            }
            return operationResult;
        }

        public async Task<object> GetByIDWithGuidAsync(string guid)
        {
            return _repo.FindAll(o => o.AccountGuid == guid).FirstOrDefault();
        }

        public async Task<object> GetAll()
        {
            return await _repo.FindAll().ToListAsync();
        }

        public async Task<object> GetInforByStoreName(string name)
        {
            return _repo.FindAll(o => o.StoreName == name).FirstOrDefault();
        }
    }
}