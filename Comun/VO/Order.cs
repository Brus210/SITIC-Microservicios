using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Text;
using System.Threading.Tasks;

namespace VO
{
    //[Id] INT NOT NULL PRIMARY KEY IDENTITY(1,1), -- Comentario de qué es
    //    [Total_Price] DECIMAL(20,2) NOT NULL,       --Precio total del pedido
    //    [Status] VARCHAR(50) NOT NULL,              --Estado del pedido(pendiente, enviado)

    //    [Created_At] DATETIME NOT NULL DEFAULT GETDATE(),	--Fecha de creacion del pedido
    //    [Updated_At] DATETIME NOT NULL DEFAULT GETDATE(),   --Fecha de ultima actualizacion del pedido
    [DataContract]
    internal class Order
    {
        [DataMember(EmitDefaultValue = false)]
        public int Id { get; set; }
        [DataMember(EmitDefaultValue = false)]
        public double Total_Price { get; set; }
        [DataMember(EmitDefaultValue = false)]
        public string Status { get; set; }
        [DataMember(EmitDefaultValue = false)]
        public DateTime Created_At { get; set; }
        [DataMember(EmitDefaultValue = false)]
        public DateTime Updated_At { get; set; }
    }
}
