using Movies.API.Responses;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Threading.Tasks;
using System.Web;
using System.Web.Script.Serialization;

namespace Movies.API
{
    public class APIHelper
    {
        private const string baseUrl = "http://www.omdbapi.com/?";

        public SearchMoviesResponse Search(string name)
        {
            try
            {
                var uri = String.Format(baseUrl + "s={0}&plot=short&r=json", Uri.EscapeUriString(name));
                var response = Get(uri);
                return Deserialize<SearchMoviesResponse>(response);
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        public MovieResponse GetMovie(string id)
        {
            try
            {
                var uri = String.Format(baseUrl + "i={0}&plot=short&r=json", Uri.EscapeUriString(id));
                var response = Get(uri);
                return Deserialize<MovieResponse>(response);
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        private WebResponse Get(string url)
        {
            try
            {
                HttpWebRequest httpWebRequest = (HttpWebRequest)WebRequest.Create(url);
                httpWebRequest.Method = WebRequestMethods.Http.Get;
                httpWebRequest.Accept = "application/json";

                return httpWebRequest.GetResponse();

            }
            catch (Exception ex)
            {
                return null;
            }
        }

        private T Deserialize<T>(WebResponse response)
        {
            try
            {
                using (var reader = new StreamReader(response.GetResponseStream()))
                {
                    JavaScriptSerializer js = new JavaScriptSerializer();
                    return js.Deserialize<T>(reader.ReadToEnd());
                }
            }
            catch (Exception ex)
            {
                return default(T);
            }
        }
    }
}