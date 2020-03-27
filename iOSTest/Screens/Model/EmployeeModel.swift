
import Foundation
struct EmployeeModel : Codable {
	let status : String?
	let data : [EmployeeData]?

	enum CodingKeys: String, CodingKey {

		case status = "status"
		case data = "data"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		status = try values.decodeIfPresent(String.self, forKey: .status)
		data = try values.decodeIfPresent([EmployeeData].self, forKey: .data)
	}

}
