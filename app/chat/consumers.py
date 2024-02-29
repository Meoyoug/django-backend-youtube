import json
from channels.generic.websocket import AsyncWebsocketConsumer
# from models import Message, ChatRoom, ChatRoomConnetor


class ChatConsumer(AsyncWebsocketConsumer):
    async def connect(self):
        self.room_name = self.scope['url_route']['kwargs']['room_name']
        self.room_group_name = 'chat_%s' % self.room_name

        # 그룹에 참여합니다.
        await self.channel_layer.group_add(
            self.room_group_name,
            self.channel_name
        )

        await self.accept()

    async def disconnect(self, close_code):
        # 그룹에서 탈퇴합니다.
        await self.channel_layer.group_discard(
            self.room_group_name,
            self.channel_name
        )

    # 클라이언트로부터 메시지를 받습니다.
    async def receive(self, text_data):
        text_data_json = json.loads(text_data)
        message = text_data_json['message']

        # 그룹으로 메시지를 보냅니다.
        await self.channel_layer.group_send(
            self.room_group_name,
            {
                'type': 'chat_message',
                'message': message
            }
        )

    # 그룹으로부터 메시지를 받습니다.
    async def chat_message(self, event):
        message = event['message']

        # 클라이언트로 메시지를 보냅니다.
        await self.send(text_data=json.dumps({
            'message': message
        }))
