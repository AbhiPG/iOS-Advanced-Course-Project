//
//  StubController.swift
//  Advance-Course-Project
//
//  Created by Caio Dias on 2018-02-28.
//  Copyright © 2018 ProDigi-Development. All rights reserved.
//

import Foundation
import Darwin
import Alamofire
import AlamofireObjectMapper

internal class StudentController {
    internal private(set) var students: [Student]!
    
    internal init() {
        self.students = generateStubStundents()
    }
    
    internal func stubMethod() -> String {
        return "It's alive!"
    }
    
    private func generateStubStundents() -> [Student] {
        var stubStudents = [Student]()
        let randomInt = Int(arc4random_uniform(16))

        for num in 0...randomInt {
            let student = Student(studentId: 0, name: "\(num)", email: "\(num)@email.com")
            stubStudents.append(student)
        }
        
        return stubStudents
    }
    
    internal func fetchAllStudents(onSuccess: @escaping () -> Void, onFail: @escaping (Error) -> Void) {
        let url: String = "https://pro-digi-advanced.firebaseio.com/student/studentId.json?auth=eyJhbGciOiJSUzI1NiIsImtpZCI6IjQzZTFiMGIyOTllNDIxZjU2ZWI1YTQ2NjhkMWNmMjNmNGFjNjk2NGMifQ.eyJpc3MiOiJodHRwczovL3NlY3VyZXRva2VuLmdvb2dsZS5jb20vcHJvLWRpZ2ktYWR2YW5jZWQiLCJhdWQiOiJwcm8tZGlnaS1hZHZhbmNlZCIsImF1dGhfdGltZSI6MTUyMDk4MjM1MiwidXNlcl9pZCI6IklIbUtSRFM5SjJhMmhxWXNPa1dOZVpXQU5RMjIiLCJzdWIiOiJJSG1LUkRTOUoyYTJocVlzT2tXTmVaV0FOUTIyIiwiaWF0IjoxNTIwOTgyMzUyLCJleHAiOjE1MjA5ODU5NTIsImVtYWlsIjoicHJvZGlnaWFkdmFuY2VkY291cnNlQGdtYWlsLmNvbSIsImVtYWlsX3ZlcmlmaWVkIjpmYWxzZSwiZmlyZWJhc2UiOnsiaWRlbnRpdGllcyI6eyJlbWFpbCI6WyJwcm9kaWdpYWR2YW5jZWRjb3Vyc2VAZ21haWwuY29tIl19LCJzaWduX2luX3Byb3ZpZGVyIjoicGFzc3dvcmQifX0.EC2vB9Kl51rKdhv-c-GSXgfvkEOZdccX_mSvhKGTJf5wzMIIUUbv_J_2PUg9R-c79O8I0Ow_Mb06Xx8jNRTjbWtpBRKV8sJn-vvdVOpNf8DyYX47OxG0sxgCUJJh3Hd5Gz4AJayz2FeebHTazUIiNQMcZrbFWMLFPCVfs_sfNFyrCfZUQRXvogYqCevxddUFzCoO50JO2X0E5T8Zi-6dATxiS1OYq1wL87Qb25N73jeGVpwQoql53SXaAqi18B_sjcS1hcMtAfypPLwUL0gr9U90nngb003sbWcvqBj2QahtEbi_1tz4opqJ2W5R2LiwFIjdVSf2C2Tvb9fULBh5Sw"
        
        Alamofire.request(url).validate().responseObject { (response: DataResponse<Student>) in
            switch response.result {
            case .success(let value):
                onSuccess()
            case .failure(let error):
                onFail(error)
            }
        }
    }
}
