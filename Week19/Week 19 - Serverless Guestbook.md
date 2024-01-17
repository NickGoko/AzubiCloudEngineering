---
tags:
  - study/alx
---
**Problem Statement:** 

Create a serverless guestbook where users can submit their names and messages. The guestbook entries should be processed and displayed using AWS Lambda and Amazon API Gateway.

**Guidelines/Goals:**

1. **Frontend Interface:**
    - Design a simple HTML form with fields for name and message.
    - Apply basic styling using CSS to make the form visually appealing.
```html
<!DOCTYPE html>
<html>
<head>
  <title>Guestbook</title>
  
  <style>
    form {
      max-width: 400px; 
      margin: 0 auto;
      padding: 20px;
      border: 1px solid #ccc;
    }
    
    label {
      display: block;
      margin-bottom: 10px;
    }
    
    input[type="text"], 
    textarea {
      width: 100%;
      padding: 8px;
      border-radius: 4px;
      border: 1px solid #ccc;
    }
    
    input[type="submit"] {
      width: auto;
      background-color: #4CAF50;
      color: white;
      padding: 12px 20px;
      border: none;
      border-radius: 4px;
      cursor: pointer;
    }
  </style>
</head>

<body>
  <h1>Guestbook</h1>
  
  <form>
    <label>Name:</label>
    <input type="text" name="name">
    
    <label>Message:</label>
    <textarea name="message"></textarea>
    
    <input type="submit" value="Submit">
  </form>
</body>
</html>
```

2. **AWS Lambda Setup:**
    - Create an AWS Lambda function to process guestbook entries.
    - Configure the Lambda function to accept input data from the API Gateway.
```python
# submitHandler Lambda function

import json

entries = []

def lambda_handler(event, context):

  # Get name and message from the event
  name = event['name'] 
  message = event['message']

  # Validation
  if not name or not message:
    return {
      'statusCode': 400,
      'body': json.dumps('Name and message are required')
    }

  # Store entry
  entry = {'name': name, 'message': message}
  entries.append(entry)

  return {
    'statusCode': 200,
    'body': json.dumps('Entry added')
  }

# getEntries Lambda function 

import json

def lambda_handler(event, context):

  return {
    'statusCode': 200,
    'body': json.dumps(entries)
  }

```

1. **API Gateway Integration:**
    - Set up an API Gateway endpoint to trigger the Lambda function.
    - Define the API's resources and methods for submitting and retrieving entries.
2. **Lambda Function Logic:**
    - In the Lambda function, capture and validate user-submitted data.
    - Store the guestbook entry details temporarily in-memory.
3. **API Gateway Response:**
    - Configure the Lambda function to return a success response to the API Gateway.
    - Implement error handling and appropriate error responses.
4. **Viewing Guestbook Entries:**
    - Create another API Gateway endpoint for retrieving and displaying guestbook entries.
    - Implement a Lambda function to retrieve the stored entries.
5. **Frontend Display (Optional):**
    
    - Design a page to display the guestbook entries.
    - Fetch entries from the API Gateway endpoint and render them on the page.
8. **Testing and Validation:**
    
    - Deploy the Lambda function and API Gateway to AWS.
    - Test the guestbook by submitting entries through the website and retrieving them.
9. **Error Handling and Logging:**
    
    - Implement error handling in the Lambda function to handle invalid input.
    - Set up logging to track Lambda function activity.
10. **Documentation:**
    - Provide a README with instructions for setting up and deploying the project.
    - Include details on testing the guestbook functionality.