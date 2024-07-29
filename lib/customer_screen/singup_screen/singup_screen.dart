import 'package:flutter/material.dart';
import 'package:kbox/Common/common_text.dart';
import 'package:kbox/Common/common_textfiled.dart';
import 'package:kbox/Common/text_style.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: TabBar(
          controller: _tabController,
          dividerHeight: 00,
          indicatorColor: Colors.red,
          tabs: const [
            Tab(
              icon: Text(CommonText.login),
            ),
            Tab(
              icon: Text(CommonText.createAccount),
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          Login(),
          RegisterTab(),
        ],
      ),
    );
  }
}

class RegisterTab extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  RegisterTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Text(
            CommonText.email,
            style: TextStyles.fourteenTSBlack,
          ),
          const SizedBox(
            height: 5,
          ),
          CommonTextFormField(
            controller: _emailController,
            labelText: CommonText.enterYourEmail,
          ),
           Text(
            CommonText.sameEmail,
            style: TextStyles.twelveGrey,
          ),
          const SizedBox(
            height: 16,
          ),
           Text(
            CommonText.password,
            style: TextStyles.fourteenTSBlack,
          ),
          const SizedBox(
            height: 5,
          ),
          CommonTextFormField(
            /*height: 100,
            maxLines: 5,*/
            controller: _passwordController,
            labelText: CommonText.createPassword,
            //obscureText: true,
          ),
          const SizedBox(
            height: 16,
          ),
           Text(
            CommonText.firstName,
            style: TextStyles.fourteenTSBlack,
          ),
          const SizedBox(
            height: 5,
          ),
          CommonTextFormField(
            controller: _confirmPasswordController,
            labelText: CommonText.createPassword,
            //obscureText: true,
          ),
          const SizedBox(
            height: 16,
          ),
           Text(
            CommonText.lastName,
            style: TextStyles.fourteenTSBlack,
          ),
          const SizedBox(
            height: 5,
          ),
          CommonTextFormField(
            controller: _confirmPasswordController,
            labelText: CommonText.createPassword,
            //obscureText: true,
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 22),
            child: Container(
              decoration: const BoxDecoration(
                  color: Color(0xff1A56DB),
                  borderRadius: BorderRadius.all(
                    Radius.circular(12),
                  )),
              height: 41,
              width: MediaQuery.of(context).size.width,
              child:  Center(
                child: Text(
                  CommonText.login,
                  style: TextStyles.fourteenTSWhite,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Login extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Text(
            CommonText.email,
            style: TextStyles.fourteenTSBlack,
          ),
          const SizedBox(
            height: 5,
          ),
          CommonTextFormField(
            controller: _emailController,
            labelText: CommonText.enterYourEmail,
          ),
          const SizedBox(
            height: 16,
          ),
           Text(
            CommonText.password,
            style: TextStyles.fourteenTSBlack,
          ),
          const SizedBox(
            height: 5,
          ),
          CommonTextFormField(
            /*height: 100,
            maxLines: 5,*/
            controller: _passwordController,
            labelText: CommonText.createPassword,
            //obscureText: true,
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 22),
            child: Container(
              decoration: const BoxDecoration(
                  color: Color(0xff1A56DB),
                  borderRadius: BorderRadius.all(
                    Radius.circular(12),
                  )),
              height: 41,
              width: MediaQuery.of(context).size.width,
              child:  Center(
                child: Text(
                  CommonText.login,
                  style: TextStyles.fourteenTSWhite,
                ),
              ),
            ),
          ),
           Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                CommonText.forgetYourPassword,
                style: TextStyles.fourteenTSBlue,
              )
            ],
          )
        ],
      ),
    );
  }
}
