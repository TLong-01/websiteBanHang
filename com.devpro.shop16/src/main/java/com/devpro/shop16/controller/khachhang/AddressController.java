//package com.devpro.shop16.controller.khachhang;
//
//import com.devpro.shop16.service.AddressService;
//import org.springframework.http.ResponseEntity;
//import org.springframework.web.bind.annotation.PostMapping;
//import org.springframework.web.bind.annotation.RequestBody;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RestController;
//
//@RestController
//@RequestMapping("/api")
//public class AddressController {
//	private final AddressService service;
//
//	public AddressController(AddressService addressService) {
//		this.service = addressService;
//	}
//
//
////	@GetMapping(value = "/provinces" )
////	public List<ProvinceDto> getProvince()  {
////		return service.province();
////	}
//
//	// API để lưu tỉnh/thành phố
//	@PostMapping("/provinces")
//	public ResponseEntity<Province> saveProvince(@RequestBody Province province) {
//		Province savedProvince = service.saveProvince(province);
//		return ResponseEntity.ok(savedProvince);
//	}
//
//	// API để lưu huyện/quận
//	@PostMapping("/districts")
//	public ResponseEntity<District> saveDistrict(@RequestBody District district) {
//		District savedDistrict = service.saveDistrict(district);
//		return ResponseEntity.ok(savedDistrict);
//	}
//
//	// API để lưu xã/phường
//	@PostMapping("/wards")
//	public ResponseEntity<Ward> saveWard(@RequestBody Ward ward) {
//		Ward savedWard = service.saveWard(ward);
//		return ResponseEntity.ok(savedWard);
//	}
//
//	// API để lấy danh sách huyện/quận dựa trên tỉnh/thành phố
////	@GetMapping("/districts")
////	public ResponseEntity<List<District>> getDistrictsByProvince(@RequestParam Long provinceId) {
////		List<District> districts = service.getDistrictsByProvince(provinceId);
////		return ResponseEntity.ok(districts);
////	}
//
//	// API để lấy danh sách xã/phường dựa trên huyện/quận
////	@GetMapping("/wards")
////	public ResponseEntity<List<Ward>> getWardsByDistrict(@RequestParam Long districtId) {
////		List<Ward> wards = service.getWardsByDistrict(districtId);
////		return ResponseEntity.ok(wards);
////	}
//
//}
