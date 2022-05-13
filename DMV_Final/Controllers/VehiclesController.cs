using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Authorization;
using Microsoft.EntityFrameworkCore;
using DMV_Final.Data;
using DMV_Final.Models;

namespace DMV_Final.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class VehiclesController : ControllerBase
    {
        private readonly DMV_DBContext _context;

        public VehiclesController(DMV_DBContext context)
        {
            _context = context;
        }

        // GET: api/Vehicles
        [Authorize]
        [HttpGet]
        public async Task<ActionResult<IEnumerable<Vehicle>>> GetVehicles()
        {
          if (_context.Vehicles == null)
          {
              return NotFound();
          }
            return await _context.Vehicles.ToListAsync();
        }


        // POST: api/Vehicles
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [Authorize]
        [HttpPost]
        public async Task<ActionResult<Vehicle>> PostVehicle(Vehicle vehicle)
        {
          if (_context.Vehicles == null)
          {
              return Problem("Entity set 'DMV_DBContext.Vehicles'  is null.");
          }
            _context.Vehicles.Add(vehicle);
            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateException)
            {
                if (VehicleExists(vehicle.VehicleId))
                {
                    return Conflict();
                }
                else
                {
                    throw;
                }
            }

            return CreatedAtAction("GetVehicle", new { id = vehicle.VehicleId }, vehicle);
        }

        // DELETE: api/Vehicles/5
        [Authorize]
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteVehicle(string id)
        {
            if (_context.Vehicles == null)
            {
                return NotFound();
            }
            var vehicle = await _context.Vehicles.FindAsync(id);
            if (vehicle == null)
            {
                return NotFound();
            }

            _context.Vehicles.Remove(vehicle);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool VehicleExists(string id)
        {
            return (_context.Vehicles?.Any(e => e.VehicleId == id)).GetValueOrDefault();
        }
    }
}
