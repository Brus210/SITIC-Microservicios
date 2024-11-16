using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Text;
using System.Threading.Tasks;

namespace VO


{
    //[Id] INT NOT NULL PRIMARY KEY IDENTITY(1,1), -- Identificador unico del elemento del carrito
    //    [Order_Id] INT NOT NULL,						--Identificador relacion al pedido(maestro)

    //    [Product_Id] INT NOT NULL,					--Identificador relacion al producto
    //    [Quantity] INT NOT NULL,					--Cantidad del producto en el carrito
    //    [Price] DECIMAL(18,2) NOT NULL,            --Precio del producto en el momento de añadirlo al carrito
    //    [Created_At] DATETIME NOT NULL DEFAULT GETDATE(),	--Fecha de creacion del producto añadido
    //    [Updated_At] DATETIME NOT NULL DEFAULT GETDATE(),   --Fecha de ultima actualizacion del producto añadido
    [DataContract]
    internal class OrderItem
    {
        [DataMember(EmitDefaultValue = false)]
        public int Id { get; set; }
        [DataMember(EmitDefaultValue = false)]
        public int Order_Id { get; set; }
        [DataMember(EmitDefaultValue = false)]
        public int Product_Id { get; set; }
        [DataMember(EmitDefaultValue = false)]
        public int Quantity { get; set; }
        [DataMember(EmitDefaultValue = false)]
        public double Price { get; set; }
        [DataMember(EmitDefaultValue = false)]
        public DateTime Created_At { get; set; }
        [DataMember(EmitDefaultValue = false)]
        public DateTime Updated_At { get; set; }
    }
}
