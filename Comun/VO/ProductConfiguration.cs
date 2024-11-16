using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Text;
using System.Threading.Tasks;

namespace VO
{
    [DataContract]
    internal class ProductConfiguration
    {
        [DataMember(EmitDefaultValue = false)]
        public int Id { get; set; }
        [DataMember(EmitDefaultValue = false)]
        public int Product_Id { get; set; }
        [DataMember(EmitDefaultValue = false)]
        public string Configuration_Name { get; set; }
        [DataMember(EmitDefaultValue = false)]
        public string Value { get; set; }
        [DataMember(EmitDefaultValue = false)]
        public DateTime Created_At { get; set; }
        [DataMember(EmitDefaultValue = false)]
        public DateTime Updated_At { get; set; }

    }
}
