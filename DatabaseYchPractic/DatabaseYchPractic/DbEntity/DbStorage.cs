﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DatabaseYchPractic.DbEntity
{
    public class DbStorage
    {
        public static PoliceDBEntities Db { get; set; } = new PoliceDBEntities();
    }
}
