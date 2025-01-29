package pages;

import io.restassured.response.Response;
import io.restassured.specification.RequestSpecification;

import java.util.List;
import java.util.Objects;

import static io.restassured.RestAssured.given;
import static org.testng.Assert.assertEquals;

public class AllPage {
    private String baseUrl;
    private Response response;
    private RequestSpecification request;

    public void toBaseUrl(String url){
        baseUrl = url;
        request = given();
    }
    public void caseMethode(String methodeAPI, String endpoint, String body){
        switch (methodeAPI){
            case "get":
                response = request.when().get(baseUrl + endpoint);
                break;
            case "post":
                response = request
                        .header("Content-Type", "application/json")
                        .body(body)
//                                ("""
//                        {
//                          "id": 2,
//                          "title": "old title",
//                          "dueDate": "2025-01-22T08:00:37.267Z",
//                          "completed": true
//                        }
//                        """)
                        .when()
                        .post(baseUrl + endpoint);
                break;
            case "put":
                response = request
                        .header("Content-Type", "application/json")
                        .body(body)
                        .when()
                        .put(baseUrl + endpoint);
                break;
            case "delete":
                response = request.when().delete(baseUrl + endpoint);
                break;
            default:
                throw new IllegalArgumentException("Invalid HTTP method: " + methodeAPI);
        }
    }

    public void validateStatusCode(Integer statusCode){
        assertEquals(response.getStatusCode(), statusCode.intValue());
    }

    public void validateKeyValueResponse(String key, String value){
        ///----------key

        //jika key kosong
        if (key == null || key.isEmpty()) {
            System.out.println("No key, then skip validation for key-value pair.");
            return; // Tidak ada key yang perlu divalidasi
        }

        //jika key ada, ambil nilai dari response (actual key) berdasarkan key
        Object actualValue = response.jsonPath().get(key);

        //jika input key dan value ada, namun nilai input key salah/tidak ada
        if (actualValue == null) {
            throw new AssertionError("[ERROR] Key '" + key + "' not found in the response!");
        }

        /// ----------value

        //jika input value (expected value) kosong, maka cek key saja
        if (value == null || value.isEmpty()) {
            System.out.println("[INFO] Key '" + key + "' exists in the response. No value provided for validation.");
            return; // Tidak perlu validasi value
        }

        /// Interger
        //jika actualValue adalah Integer
        if (actualValue instanceof Integer) { // periksa actual value dan proses expected value (ubah tipedata lalu bandingkan nilai)
            int expectedValue;
            try {
                expectedValue = Integer.parseInt(value); //ubah expected value ke int
            }
            catch (NumberFormatException e) { //jika expected value gagal diubah ke int (bisa jadi karena expected value adalah karakter/campuran)
                throw new AssertionError("[ERROR] Value '" + value + "' is not a valid integer!");
            }
            if (!actualValue.equals(expectedValue)) { //bandingkan nilai jika expected value berhasil diubah menjadi int, namun jika expectedValue =! actualValue maka
                throw new AssertionError("[ERROR] Value mismatch for key: " + key +
                        " expected [" + expectedValue + "] but found [" + actualValue + "]");
            }
        }

        /// String
        //jika actualValue adalah String. langsung bandingkan tidak perlu ada perubahan tipedata karena nilai excample adalah string
        else if (actualValue instanceof String) {
            if (!((String) actualValue).contains(value)) { //jika expectedValue =! actualValue
                throw new AssertionError("[ERROR] Value mismatch for key: " + key +
                        " expected to contain [" + value + "] but found [" + actualValue + "]");
            }
        }

        /// List/array
        //jika actualValue adalah List
        else if (actualValue instanceof List) {
            List<?> actualList = (List<?>) actualValue;
            boolean containsValue = actualList.stream()
                    .filter(Objects::nonNull)
                    .anyMatch(item -> item.toString().contains(value));

            if (!containsValue) { //jika expectedValue tidak ditemukan dalam actualValue
                throw new AssertionError("[ERROR] Value mismatch for key: " + key +
                        " expected [" + value + "] but none of the values matched in the list: " + actualList);
            }
        }

        //jika tipe data tidak dikenali
        else {
            throw new AssertionError("[ERROR] Unsupported type for key: " + key +
                    ". Actual value type: " + actualValue.getClass().getName());
        }

        // Validasi nilai key dengan value yang diharapkan
        System.out.println("Validating key-value pair:");
        System.out.println("  - Expected key:   " + key);
        System.out.println("  - Validated key:  " + key);
        System.out.println("  - Expected value: " + value);
        System.out.println("  - Actual value:   " + actualValue);

        System.out.println("[INFO] Validation passed: Key '" + key + "' contains expected value '" + value + "'.");
    }
}
