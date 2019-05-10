using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _001___OOPS_Review
{
	class FencePanel2
	{

		private string _firstName;
		private string _lastName;

		public Name(string firstName, string lastName)
		{
			FirstName = firstName;
			LastName = lastName;
		}

		public Name()
		{
			FirstName = "Unknown";
			LastName = "Unknown";
		}

		public override string ToString()
		{
			return "Last name: " + LastName + " First name: " + FirstName;
		}

		public string FirstName
		{
			get
			{
				return _firstName;
			}
			set
			{
				if (value == "")
					throw new Exception("Invalid first name");
				_firstName = value;
			}
		}

		public string LastName
		{
			get
			{
				return _lastName;
			}
			set
			{
				if (value == "")
					throw new Exception("Invalid last name");
				_lastName = value;
			}
		}

	}
}
