    using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DatabaseYchPractic.DbEntity
{
    public static class DbStorage
    {
        public static TradeEntities Db { get; set; } = new TradeEntities();
    }
}
