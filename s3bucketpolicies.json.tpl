{
    "Statement": [
        {
            "Action": [
                "s3:GetObject"
            ],
            "Effect": "Allow",
            "Resource": "arn:aws:s3:::${backetname}/*",
            "Principal": {
                "AWS": [
                    "*"
                ]
            }
        }
    ]
}