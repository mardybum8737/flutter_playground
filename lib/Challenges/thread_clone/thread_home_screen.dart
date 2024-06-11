import 'package:flutter/material.dart';
import 'package:flutter_playground/Challenges/thread_clone/widgets/thread_contents_borderline.dart';
import 'package:flutter_playground/Challenges/thread_clone/widgets/thread_image_content.dart';
import 'package:flutter_playground/Challenges/thread_clone/widgets/thread_logo.dart';
import 'package:flutter_playground/Challenges/thread_clone/widgets/thread_only_text_content.dart';
import 'package:flutter_playground/NomadCoder_TIKTOK/constants/gaps.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ThreadHomeScreen extends StatelessWidget {
  const ThreadHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Gaps.v120,
        ThreadImageContent(
          username: 'Grogu',
          userImage:
              'https://images.bauerhosting.com/empire/2023/03/grogu.jpg?ar=16%3A9&fit=crop&crop=top&auto=format&w=1440&q=80',
          contentText: 'I am Grogu',
          contentImage:
              'https://images.bauerhosting.com/empire/2023/03/grogu.jpg?ar=16%3A9&fit=crop&crop=top&auto=format&w=1440&q=80',
          timeAgo: '2m',
          replies: 32,
          likes: 404,
          isVerified: true,
          replyImage1:
              'https://cdn.mos.cms.futurecdn.net/noiRrtGS6iDdAsFaDKEySM-1200-80.jpg',
          replyImage2:
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT98sRogdaNziJkAvNQbbjHY4AJniYvS-NbEw&s',
          replyImage3:
              'https://i.redd.it/generated-some-grogu-pics-using-ai-v0-yoxgwd0azloa1.png?width=896&format=png&auto=webp&s=9e0f6145c35b7569f3b9a425dd3c35de8c8aad3d',
        ),
        ThreadContentsBorderline(),
        ThreadOnlyTextContent(
          username: 'LeGoat',
          userImage:
              'https://img1.daumcdn.net/thumb/R1280x0/?fname=http://t1.daumcdn.net/brunch/service/user/12Lo/image/swKJM9TbsrHzf6hRaMCQfnBi1r0.png',
          contentText:
              'At the end of the day, all the people that was rooting on me to fail, at the end of the day they have to wake up tomorrow and have the same life that they had before they woke up today, They have the same personal problems they had today. ',
          timeAgo: '2m',
          replies: 23,
          likes: 920,
          isVerified: false,
          replyImage1:
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcREIgveFR8kFR5ubDxT8S45fdJr6tE_sK3Fow&shttps://cdn.mos.cms.futurecdn.net/noiRrtGS6iDdAsFaDKEySM-1200-80.jpghttps://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcREIgveFR8kFR5ubDxT8S45fdJr6tE_sK3Fow&s',
          replyImage2:
              'https://upload.wikimedia.org/wikipedia/commons/a/ae/Michael_Jordan_in_2014.jpg',
          replyImage3:
              'https://i.redd.it/generated-some-grogu-pics-using-ai-v0-yoxgwd0azloa1.png?width=896&format=png&auto=webp&s=9e0f6145c35b7569f3b9a425dd3c35de8c8aad3d',
        ),
        ThreadContentsBorderline(),
        ThreadImageContent(
          username: 'Din Jarin',
          userImage:
              'https://cdn.mos.cms.futurecdn.net/w69KswqfwebHt4TiZ4HmCd-1200-80.jpg',
          contentText: 'This is the way',
          contentImage:
              'https://assetsio.gnwcdn.com/mandalorian-headline.jpg?width=1200&height=1200&fit=bounds&quality=70&format=jpg&auto=webp',
          timeAgo: '2m',
          replies: 32,
          likes: 404,
          isVerified: false,
          replyImage1:
              'https://www.theshirtlist.com/wp-content/uploads/2022/01/This-is-the-Way.jpg',
          replyImage2:
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT98sRogdaNziJkAvNQbbjHY4AJniYvS-NbEw&s',
          replyImage3:
              'https://i.redd.it/generated-some-grogu-pics-using-ai-v0-yoxgwd0azloa1.png?width=896&format=png&auto=webp&s=9e0f6145c35b7569f3b9a425dd3c35de8c8aad3d',
        ),
      ],
    );
  }
}
