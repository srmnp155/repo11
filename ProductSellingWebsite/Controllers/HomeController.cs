using Microsoft.AspNetCore.Mvc;
using ProductSellingWebsite.Data;

namespace ProductSellingWebsite.Controllers
{
    public class HomeController : Controller
    {
        private readonly ApplicationDbContext _context;

        public HomeController(ApplicationDbContext context)
        {
            _context = context;
        }

        public IActionResult Index()
        {
            var products = _context.Products.ToList();
            return View(products);
        }

        public IActionResult Error()
        {
            return View();
        }
    }
}
