using System;

namespace WebApplication1.Model
{
    public class ReviewResponse
    {
        public int ResponseID { get; set; }

        public int ReviewID { get; set; }

        public int RepresentativeID { get; set; }

        public string ResponseText { get; set; }

        public DateTime ResponseDate { get; set; }
    }
}