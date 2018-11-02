using System;
using System.Collections.Generic;
using System.Text;

namespace DynThings.WebAPI.Models.ResponseModels
{
    public class PagingInfoResponseModel
    {
        public int CurrentPage { get; set; }
        public int ItemsPerPage { get; set; }
        public int ItemsCount { get; set; }
        public int PagesCount { get; set; }


        //ReadOnly
        public int PagedFirstItemNumber { get { return (CurrentPage * ItemsPerPage) - (ItemsPerPage - 1); } }
        public int PagedLastItemNumber
        {
            get
            {
                int result = CurrentPage * ItemsPerPage;
                if (ItemsCount < result) { result = ItemsCount; }
                return result;
            }
        }

        public bool IsFirstPage { get { if (CurrentPage == 1) { return true; } else { return false; } } }
        public bool IsLastPage { get { if (PagedLastItemNumber == ItemsCount) { return true; } else { return false; } } }

    }
}
