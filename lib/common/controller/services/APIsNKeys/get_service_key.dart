

import 'package:googleapis_auth/auth_io.dart';

Future<String> getAccessToken() async {
  var accountCredentials = ServiceAccountCredentials.fromJson(r'''
  {
  "type": "service_account",
  "project_id": "cab-booking-app-5a700",
  "private_key_id": "0e44c4e291c1c06043dd8298a15d16ef6b07f734",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQDLBwP2iQmm8j6Q\nK4dzx/OaBF5ljN232XBiI/sv70CUkxgixtetoxkE5yjwQFCcI8LyKJJ3L9Ir+PSE\nBOpHZlHo3CypkSxIQUOoRqs4HmtfRRItSF2HrB73EGbnTosO/dvImR9Ax5fx6F4R\n0o7Cw/72aXYj3jvnqMw5sDyps/tKWlE+I/7vDm9TQKE6Q30Q90lB/e7syTOJwtwf\nwZ3P/vp10wvQUynpvosN/BgYvmcNPBKEcXP9xRJhINpwuzvXBnjimnuvhPSU0lyD\nTcji8jD5NcAbSo7ZATL1V7IZkk3FX5psGh+T2T/RCJg5OXGsV3NXoiHhGAmr7EVI\naaaaPfHxAgMBAAECggEACTsITHgKSO10V/psqgBOJGNctdX/2h0gEYw0fkdMyrx9\n0U30ThwPVgRa/YJVD+ZF1Zvv3cyeK/rhhhORob2mjXVeL/buWhoihPbyj6Z9Z/tU\nUlv7CaEzFrVHkm5lHuE+kfoZPEke0MQpa7rEnBkMYWBl20deNp/7ageH2Ija7NRF\n428wK3UkV72yjYrwHUC6QPcrNh/Mv/YqVMRwblezZzeVQOs3V95hctTcDzWOwhed\nVzwETZog7QceSdi8DHrY2t0oSP1etqucOlGEQ72cuNRMo5TEbgUL5zyOhiGVqHc/\nOoWOtpiEP5xZFIJux9MgEUrNDzQCUcaFupntd2cpAQKBgQDuPS41eJZuucdYfU1B\nIa+H9UPuhqjxDZNAt0/FRQgOozucyVei+TVaCMGl5JIDQbIcco1z0jWwGFjv7wpy\nqhoctrUWpGZGl+w3i382DqwoQEc3MMlAUiNfTpq/627TKYjMRSzS5PKWoII0vXGV\njrqdC8KefpE7K6MfgxDiUhZNgQKBgQDaKdFWqlM0QZ7N9rshnfO9Er1FzijcufIs\nP4Oq1RP2IQNph0fMe2P5FMC2F/uMhHxhoRgS48sM/5YyW4qgUzgLpjVZWJqAJdUA\ng15b5/3H/TOdXSBRASZTYqcDzGuaTseijvKbL/MqGMr6EKbrAshPPf+CLoJASMaK\n9aaaAPu8cQKBgFrLxF2qnKKMeTX3Y0cMYIqPZhl1BtP/2XwToPpM6doySdjiP10k\nXzn2Fl90MlW9ZvVCjzhyB/YaAWNIFhJHU/ZXh8KeW0BSTDuLFatzghdBECMvm7PA\n2ixLl9zHDJC7xqAbSQ8DJJVVjOouvShDokmSHtUq5YzIf73VxMyMfmWBAoGASTfd\nrRNu50vaq09SUJ79TYh7g3EEX8f8UgNjAjOPBnzf80vWufbzf4YKg1KbNvbD89Qo\nCzbuT8d7thzo8pPbbHV01C6bc8S+rvRn97ptfvAooXi+vtD+9t9WJD04I8qqz5Dg\nNVsrZgZ6IODz1E3TwlyRYzSOvFpwX/S/3FHWKtECgYBLzuTOBvUhIAqgVKlb4XZW\nItQ6SRGzCsiH4APJNydEc//wPSBCA8BajSVvUoGzvp9peviJt1AtnEllc7nUFLp2\ndu6NEWQ2q47s169ASHnIFCdHHWQRtJlHT2Qy4O3n03bw7C7tDIyx50LjLq/UOO/w\n8zCWn2feR6aZ820DSokFjQ==\n-----END PRIVATE KEY-----\n",
  "client_email": "firebase-adminsdk-nkwcf@cab-booking-app-5a700.iam.gserviceaccount.com",
  "client_id": "111323129069161418601",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/firebase-adminsdk-nkwcf%40cab-booking-app-5a700.iam.gserviceaccount.com",
  "universe_domain": "googleapis.com"
}
  ''');

  var scopes = ['https://www.googleapis.com/auth/firebase.messaging'];

  var authClient = await clientViaServiceAccount(accountCredentials, scopes);
  var accessToken = (await authClient.credentials).accessToken.data;
  return accessToken;
}
