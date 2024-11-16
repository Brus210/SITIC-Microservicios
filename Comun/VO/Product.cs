using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Text;
using System.Threading.Tasks;

namespace VO
{

    //clase para obligatoriamente unicas
    [DataContract]
    internal class Product
    {
        [DataMember(EmitDefaultValue =false)]
        public int Id { get; set; }
        [DataMember(EmitDefaultValue = false)]
        public string Name { get; set; }
        [DataMember(EmitDefaultValue = false)]
        public string Description { get; set; }
        [DataMember(EmitDefaultValue = false)]
        public decimal Price { get; set; }
        [DataMember(EmitDefaultValue = false)]
        public int Current_Stock { get; set; }
        [DataMember(EmitDefaultValue = false)]
        public int Max_Stock { get; set; }
        [DataMember(EmitDefaultValue = false)]
        public int Min_Stock { get; set; }
        //crear clase diferente para los enumarados (status del stock)
        [DataMember(EmitDefaultValue = false)]
        public eStockStatus Stock_Status_Id { get; set; }
        [DataMember(EmitDefaultValue = false)]
        public string Image_Path { get; set; }
        [DataMember(EmitDefaultValue = false)]
        public DateTime Created_At { get; set; }
        [DataMember(EmitDefaultValue = false)]
        public DateTime Updated_At { get; set; }
    }
}
