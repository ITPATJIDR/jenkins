#!/bin/bash

# Print the current date and time
echo "Current date and time: $(date)"

# Assign the current date to the DATE variable
DATE=$(date +%H-%M-%S)
echo "DATE variable value: $DATE"

# Construct the backup file name
BACKUP=db-$DATE.sql
echo "Backup file name: $BACKUP"

# Assign the script arguments to variables
DB_HOST=$1
DB_PASSWORD=$2
DB_NAME=$3
AWS_SECRET=$4
BUCKET_NAME=$5

# Print the values of script arguments
echo "DB_HOST: $DB_HOST"
echo "DB_PASSWORD: $DB_PASSWORD"
echo "DB_NAME: $DB_NAME"
echo "AWS_SECRET: $AWS_SECRET"
echo "BUCKET_NAME: $BUCKET_NAME"

# Dump the MySQL database to a backup file
echo "Dumping MySQL database..."
mysqldump -u root -h $DB_HOST -p$DB_PASSWORD $DB_NAME > /tmp/$BACKUP && \ 
echo "MySQL database dumped successfully"

# Set AWS credentials
export AWS_ACCESS_KEY_ID=AKIA4PBJ3LMMNIAXAGHO
export AWS_SECRET_ACCESS_KEY=$AWS_SECRET
echo "AWS credentials set"

# Upload the backup file to S3
echo "Uploading the backup file to S3..."
aws s3 cp /tmp/db-$DATE.sql s3://$BUCKET_NAME/$BACKUP && \
echo "Backup file uploaded to S3 successfully"

