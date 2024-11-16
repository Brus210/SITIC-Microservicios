using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Text;
using System.Threading.Tasks;

namespace VO
{
    //[Id] INT NOT NULL PRIMARY KEY IDENTITY(1,1), -- Idenficador unico del carrito
    //    [Created_At] DATETIME NOT NULL DEFAULT GETDATE(), --Fecha de creacion del carrito
    //    [Updated_At] DATETIME NOT NULL DEFAULT GETDATE()  --Fecha de ultima actualizacion del carrito
    [DataContract]
    internal class Cart
    {
        [DataMember(EmitDefaultValue = false)]
        public int Id { get; set; }
        [DataMember(EmitDefaultValue = false)]
        public DateTime Created_At { get; set; }
        [DataMember(EmitDefaultValue = false)]
        public DateTime Updated_At { get; set; }
    }
}
