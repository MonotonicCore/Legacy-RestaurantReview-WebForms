namespace WebApplication1.Model
{
    public class ReviewImage
    {
        public int ImageID { get; set; }

        public int ReviewID { get; set; }

        public string FileName { get; set; }

        public string ContentType { get; set; }

        public byte[] ImageData { get; set; }
    }
}