

import Foundation
struct EmployeeData : Codable {
	let id : String?
	let employee_name : String?
	let employee_salary : String?
	let employee_age : String?
	let profile_image : String?

	enum CodingKeys: String, CodingKey {

		case id = "id"
		case employee_name = "employee_name"
		case employee_salary = "employee_salary"
		case employee_age = "employee_age"
		case profile_image = "profile_image"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		id = try values.decodeIfPresent(String.self, forKey: .id)
		employee_name = try values.decodeIfPresent(String.self, forKey: .employee_name)
		employee_salary = try values.decodeIfPresent(String.self, forKey: .employee_salary)
		employee_age = try values.decodeIfPresent(String.self, forKey: .employee_age)
		profile_image = try values.decodeIfPresent(String.self, forKey: .profile_image)
	}

}
