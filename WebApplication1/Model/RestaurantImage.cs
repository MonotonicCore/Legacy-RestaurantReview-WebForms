namespace WebApplication1.Model
{
    public class RestaurantImage
    {
        public int ImageID { get; set; }

        public int RestaurantID { get; set; }

        public string FileName { get; set; }

        public string ContentType { get; set; }

        public byte[] ImageData { get; set; }

        public string Caption { get; set; }
    }
}