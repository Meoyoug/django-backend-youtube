# 유튜브 백엔드 구현

## 1. REST API
### (1) 모델 구조
1. User (Custom)
    - email(user_id)
    - password
    - nickname
    - is_business(Boolean) : personal, business

2. Video
    - title
    - link
    - description
    - thumbnail
    - video_uploaded_url (S3)
    - video_file(FileField)
    - category
    - views_count
    - User : FK

3. Like/Dislike
    - Video : FK (Video : 1, Like/Dislike : n)
    - User : FK
    
4. Subscription
    - User : FK => Subscriber(구독자)
    - User : FK => Subscribed_to

5. Comment
    - Video : FK
    - User : FK
    - like
    - dislike
    - content

6. Notification
    - message
    - is_read (읽었는지 여부 : Boolean)
    - User : FK

7. Common
    - Created_at
    - Updated_at