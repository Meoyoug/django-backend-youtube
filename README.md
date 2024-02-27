# 유튜브 백엔드 구현

## 1. REST API
### (1) 모델 구조
1. User (Custom)
    - email(user_id)
    - password
    - nickname
    - is_business(Boolean) : personal, business

#### (1) User Model 생성
- docker-compose run --rm app sh -c 'django-admin startapp users'
- app.settings 수정 (AUTH_USER_MODEL = 'users.User' 추가, INSTALLED_APPS = 'users.apps.UsersConfig' 추가)
- UserModel 작성 (AbstactBaseModel 상속)
- makemigrations -> migrate 해서 db 적용

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