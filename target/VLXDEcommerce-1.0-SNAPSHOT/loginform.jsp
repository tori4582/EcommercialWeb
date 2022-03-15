<%-- 
    Document   : loginform
    Created on : 15 Mar 2022, 10:51:56 pm
    Author     : hungt
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<section>
    
    <div id="login-offcanvas" uk-offcanvas="overlay: true; flip: true">
        <div class="uk-offcanvas-bar uk-width-1-4">
            <button class="uk-offcanvas-close" type="button" uk-close></button>

            <div class="input-form">
                <h2>Đăng nhập</h2>

                <form class="uk-form-stacked" action="login" method="post">
                    <div class="uk-margin">
                        <label class="uk-form-label">Username</label>
                        <div class="uk-inline uk-width-1-1">
                            <span class="uk-form-icon" uk-icon="icon: user"></span>
                            <input name="user" class="uk-input" type="text">
                        </div>
                    </div>
                    <div class="uk-margin">
                        <label class="uk-form-label">Password</label>
                        <div class="uk-inline uk-width-1-1">
                            <span class="uk-form-icon" uk-icon="icon: lock"></span>
                            <input name="pass" class="uk-input" type="password">
                        </div>
                    </div>
                    <div class="uk-margin">
                        <!-- Lẽ ra sẽ có ghi nhớ đăng nhập ở đây :)))) -->
                    </div>
                    <div class="uk-margin">
                        <button class="uk-button uk-button-danger uk-width-1-1" type="submit">
                            <span class="uk-form-icon" uk-icon="icon: sign-in"></span>
                            <span>Đăng nhập</span>
                        </button>
                    </div>
                    <div class="uk-margin">
                        Bạn chưa có tài khoản?
                        <a href="" id="signup-switcher" uk-toggle="target: .input-form; animation: uk-animation-slide-right">Tạo tài khoản</a>
                    </div>
                </form>
            </div>

            <div class="input-form" hidden>
                <h2>Tạo tài khoản</h2>
                <form class="uk-form-stacked" action="login" method="post">
                    <div class="uk-margin">
                        <label class="uk-form-label">Username</label>
                        <div class="uk-inline uk-width-1-1">
                            <span class="uk-form-icon" uk-icon="icon: user"></span>
                            <input name="user" class="uk-input" type="text">
                        </div>
                    </div>
                    <div class="uk-margin">
                        <label class="uk-form-label">Password</label>
                        <div class="uk-inline uk-width-1-1">
                            <span class="uk-form-icon" uk-icon="icon: lock"></span>
                            <input name="pass" class="uk-input" type="password">
                        </div>
                    </div>
                    <div class="uk-margin">
                        <label class="uk-form-label">Confirm your password</label>
                        <div class="uk-inline uk-width-1-1">
                            <span class="uk-form-icon" uk-icon="icon: lock"></span>
                            <input name="repass" class="uk-input" type="password">
                        </div>
                    </div>
                    <div class="uk-margin">
                        <!-- Lẽ ra sẽ có ghi nhớ đăng nhập ở đây :)))) -->
                    </div>
                    <div class="uk-margin">
                        <button class="uk-button uk-button-danger uk-width-1-1" type="submit">
                            <span uk-icon="icon: sign-in"></span>
                            <span>Tạo tài khoản</span>
                        </button>
                    </div>
                </form>
            </div>



        </div>
    </div>
    
    
    <script>
        window.onload = () => {
            const aLink = document.getElementById('signup-switcher');
//            aLink.onclick = () => {
//                const signupForm = document.getElementById('form-signup');
//                signupForm.style.cssText += 'display: none'
//            }
        }
    </script>
    
</section>