namespace ProyectoMvcNetCoreAlmacen.Services
{
    public interface IBlobStorageService
    {
        Task<string> UploadFileAsync(IFormFile file, string fileName);
        Task<Stream> GetFileAsync(string fileName);
        Task DeleteFileAsync(string fileName);
    }
}
