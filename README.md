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
    - reactions (좋아요, 싫어요 기능)
    
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
## AWS 배포
### IAM 사용자 생성
1. 생성하기 버튼
2. 사용자 이름 입력, 직접생성 비밀번호 입력
3. 권한정책 직접 선택 -> AdministratorAccess 선택 후 생성

### AWS key-pair create
1. 터미널에서 ssh-keygen -t rsa -b 4096 입력 후 경로에 파일이름 입력 후 비밀번호 입력
2. cat 키페어파일이름.pub 명령어로 파일열어서 키값 복사

### EC2 인스턴스 생성 후 연결
1. EC2 이름 입력
2. amazon Linux 2023 AMI 이미지 선택 (프리티어)
3. 키페어 선택
4. 보안 그룹 생성 -> 인터넷에서 HTTP 트래픽 허용 체크
5. 인스턴스 시작
6. 인스턴스에 연결 클릭
7. 터미널에 ssh-add 키페어파일이름 입력해서 ssh에 키페어 연결
8. ssh ec2-user@복사한 퍼블릭 ipv4 주소 입력해서 ssh 접속
9. 