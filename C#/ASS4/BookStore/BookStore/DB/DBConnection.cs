﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;

namespace BookStore.DB
{
    class DBConnection
    {
        public static SqlConnection GetConnection()
        {
            //string conStr = @"Data Source=SE140655\SQLEXPRESS;Initial Catalog=BookStore;Persist Security Info=True;User ID=sa; Password= danh123";
            string conStr = @"server=(local);databse=BookStore;uid=sa;pwd= danh123";
            SqlConnection conn = new SqlConnection(conStr);
            return conn;
        }
    }
}
