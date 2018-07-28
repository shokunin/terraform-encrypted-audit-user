# Output file

output auditor-secret {
  value = "\n-----BEGIN PGP MESSAGE-----\n\n${aws_iam_access_key.auditor.encrypted_secret}\n-----END PGP MESSAGE-----\n"
}

output auditor-id {
  value = "${aws_iam_access_key.auditor.id}"
}

