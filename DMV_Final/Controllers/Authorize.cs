using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using DMV_Final.Data;
using DMV_Final.Models;
using Microsoft.AspNetCore.Authorization;

namespace DMV_Final.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AuthenticationController : ControllerBase
    {
        private readonly JwtAuthenticationManager _jwtAuthenticationManager;
        private readonly DMV_DBContext _context;

        public AuthenticationController(JwtAuthenticationManager jwt, DMV_DBContext context)
        {
            _jwtAuthenticationManager = jwt;
            _context = context;
        }
        /*
        [AllowAnonymous]
        [HttpPost]
        public async Task<ActionResult<string>> UserLogin([FromBody] UserAccount usr)
        {

            var token = _jwtAuthenticationManager.Authenticate(usr.username, usr.password);
            if (token == null)
            {
                return Unauthorized();
            }
            return Ok(token);
        }
        */
        [AllowAnonymous]
        [HttpPost("Users")]
        public async Task<ActionResult<string>> User_Login([FromBody] UserAccount user)
        {

            var DMVPull = from var in _context.Users where var.Username == user.username && var.Password == user.password select var;

            var DMVPullList =   DMVPull.ToList();

            if (DMVPullList.Count() > 0)
            {
                var token = _jwtAuthenticationManager.Authenticate(DMVPullList[0].UserId, DMVPullList[0].Position);
                return token;
            }
            else
            {
                return BadRequest("User not found");
            }
        }
    }

    public class UserAccount
    {
        public string? username { get; set; }
        public string? password { get; set; }
    }
}