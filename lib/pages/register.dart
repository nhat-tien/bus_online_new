import 'package:bus_online/controllers/register_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final RegisterController controller = Get.put(RegisterController());
  final formKey = GlobalKey<FormState>();

  final field1Key = GlobalKey<FormFieldState>();
  final field2Key = GlobalKey<FormFieldState>();
  final field3Key = GlobalKey<FormFieldState>();
  final field4Key = GlobalKey<FormFieldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height,
            ),
            child: SafeArea(
              child: Stack(
                children: [
                  Positioned(
                    top: -80,
                    right: -80,
                    child: Container(
                      width: 210,
                      height: 210,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: -80,
                    left: -80,
                    child: Container(
                      width: 180,
                      height: 180,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  Center(
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        minHeight: MediaQuery.of(context).size.height,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          const Text(
                            'ĐĂNG KÍ',
                            style: TextStyle(
                              fontSize: 25,
                              color: Colors.green,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 20),
                          Form(
                            key: formKey,
                            child: Builder(
                              builder: (BuildContext context) {
                                return Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 25,
                                      ),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.grey[200],
                                          border: Border.all(
                                            color: Colors.white,
                                          ),
                                          borderRadius: BorderRadius.circular(
                                            12,
                                          ),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                            left: 8,
                                          ),
                                          child: TextFormField(
                                            key: field1Key,
                                            obscureText: false,
                                            autovalidateMode:
                                                AutovalidateMode
                                                    .onUserInteraction,
                                            keyboardType: TextInputType.text,
                                            controller:
                                                controller.nameController,
                                            textAlignVertical:
                                                TextAlignVertical(y: 0),
                                            validator: (value) {
                                              return controller.nameValidator(
                                                value!,
                                              );
                                              // return null;
                                            },
                                            decoration: const InputDecoration(
                                              border: InputBorder.none,
                                              hintText: 'Tên',
                                              contentPadding: EdgeInsets.all(0),
                                              prefixIcon: Padding(
                                                padding: EdgeInsets.all(0),
                                                child: Icon(
                                                  Icons.person,
                                                  size: 20,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 25,
                                      ),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.grey[200],
                                          border: Border.all(
                                            color: Colors.white,
                                          ),
                                          borderRadius: BorderRadius.circular(
                                            12,
                                          ),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                            left: 8,
                                          ),
                                          child: TextFormField(
                                            key: field2Key,
                                            obscureText: false,
                                            autovalidateMode:
                                                AutovalidateMode
                                                    .onUserInteraction,
                                            keyboardType:
                                                TextInputType.emailAddress,
                                            controller:
                                                controller.emailController,
                                            textAlignVertical:
                                                TextAlignVertical(y: 0),
                                            validator: (value) {
                                              // return controller
                                              // 		.emailValidator(value!);
                                              return null;
                                            },
                                            decoration: const InputDecoration(
                                              border: InputBorder.none,
                                              hintText: 'Email',
                                              contentPadding: EdgeInsets.all(0),
                                              prefixIcon: Padding(
                                                padding: EdgeInsets.all(0),
                                                child: Icon(
                                                  Icons.person,
                                                  size: 20,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 25,
                                      ),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.grey[200],
                                          border: Border.all(
                                            color: Colors.white,
                                          ),
                                          borderRadius: BorderRadius.circular(
                                            12,
                                          ),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                            left: 10,
                                          ),
                                          child: Obx(
                                            () => TextFormField(
                                              key: field3Key,
                                              obscureText:
                                                  !controller
                                                      .passwordVisible
                                                      .value,
                                              autovalidateMode:
                                                  AutovalidateMode
                                                      .onUserInteraction,
                                              controller:
                                                  controller.passwordController,
                                              textAlignVertical:
                                                  TextAlignVertical(y: 0),
                                              validator: (value) {
                                                return controller
                                                    .passwordValidator(value!);
                                                // return null;
                                              },
                                              decoration: InputDecoration(
                                                border: InputBorder.none,
                                                hintText: 'Mật khẩu',
                                                contentPadding: EdgeInsets.all(
                                                  0,
                                                ),
                                                prefixIcon: const Padding(
                                                  padding: EdgeInsets.all(0),
                                                  child: Icon(
                                                    Icons.lock,
                                                    size: 20,
                                                  ),
                                                ),
                                                suffixIcon: IconButton(
                                                  onPressed: () {
                                                    controller
                                                        .passwordVisible
                                                        .value = !controller
                                                            .passwordVisible
                                                            .value;
                                                  },
                                                  icon: Icon(
                                                    controller
                                                            .passwordVisible
                                                            .value
                                                        ? Icons.visibility
                                                        : Icons.visibility_off,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 25,
                                      ),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.grey[200],
                                          border: Border.all(
                                            color: Colors.white,
                                          ),
                                          borderRadius: BorderRadius.circular(
                                            12,
                                          ),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                            left: 10,
                                          ),
                                          child: Obx(
                                            () => TextFormField(
                                              key: field4Key,
                                              obscureText:
                                                  !controller
                                                      .repeatPasswordVisible
                                                      .value,
                                              autovalidateMode:
                                                  AutovalidateMode
                                                      .onUserInteraction,
                                              scrollPadding: EdgeInsets.only(
                                                bottom: 40,
                                              ),
                                              controller:
                                                  controller
                                                      .repeatPasswordController,
                                              textAlignVertical:
                                                  TextAlignVertical(y: 0),
                                              validator: (value) {
                                                return controller
                                                    .repeatPasswordValidator(
                                                      value!,
                                                    );
                                                // return null;
                                              },
                                              decoration: InputDecoration(
                                                border: InputBorder.none,
                                                hintText: 'Nhập lại mật khẩu',
                                                contentPadding: EdgeInsets.all(
                                                  0,
                                                ),
                                                prefixIcon: const Padding(
                                                  padding: EdgeInsets.all(0),
                                                  child: Icon(
                                                    Icons.lock,
                                                    size: 20,
                                                  ),
                                                ),
                                                suffixIcon: IconButton(
                                                  onPressed: () {
                                                    controller
                                                        .repeatPasswordVisible
                                                        .value = !controller
                                                            .repeatPasswordVisible
                                                            .value;
                                                  },
                                                  icon: Icon(
                                                    controller
                                                            .repeatPasswordVisible
                                                            .value
                                                        ? Icons.visibility
                                                        : Icons.visibility_off,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 25,
                                      ),
                                      child: ElevatedButton(
                                        onPressed: () {
                                          if (formKey.currentState!
                                              .validate()) {
                                            controller.register();
                                          }
                                        },
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: const Color(
                                            0xff50AAF7,
                                          ),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                              10,
                                            ),
                                          ),
                                          minimumSize: Size.fromHeight(50),
                                        ),
                                        child: const Text(
                                          'Đăng kí',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            child: TextButton(
                              onPressed: () {
                                Get.offNamed('/login');
                              },
                              child: const Text(
                                'Bạn đã có tài khoản?, đi đến đăng nhập',
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.green),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
