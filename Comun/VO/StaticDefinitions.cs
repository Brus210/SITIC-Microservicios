using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace VO
{
    public enum eStockStatus
    {
        IN_STOCK = 1,
        OUT_OF_STOCK,
        LOW_STOCK
    }

    //enum para identificar que tipo de proceso se va a realizar
    public enum eProcessType
    {
        INSERT = 1,
        UPDATE,
        DELETE
    }
}
