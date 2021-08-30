<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="Perituza.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login Form</title>
    <link href="Content/bootstrap-grid.min.css" rel="stylesheet" />
    <link href="Content/bootstrap-reboot.min.css" rel="stylesheet" />
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link href="Content/Site.css" rel="stylesheet" />
    <link href="assests/css/login.css" rel="stylesheet" />

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-sweetalert/1.0.1/sweetalert.min.css" integrity="sha512-hwwdtOTYkQwW2sedIsbuP1h0mWeJe/hFOfsvNKpRB3CkRxq8EW7QMheec1Sgd8prYxGm1OM9OZcGW7/GUud5Fw==" crossorigin="anonymous" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-sweetalert/1.0.1/sweetalert.min.js" integrity="sha512-MqEDqB7me8klOYxXXQlB4LaNf9V9S0+sG1i8LtPOYmHqICuEZ9ZLbyV3qIfADg2UJcLyCm4fawNiFvnYbcBJ1w==" crossorigin="anonymous"></script>

    <script>
         //Show error Message
        function error()
        {
            swal("Error", "Invalid Login please check username and password...!", "error");
        }

        //Show saved success alert
        function successalert()
        {
            swal("Record Added!", "You Registered a New Customer.!", "success");
        }
    </script>
</head>
<body class="bg">
    <section class="container-fluid">
        <section class="row justify-content-center">
            <section class="col-12 col-sm-6 col-md-3">
                <form id="form1" runat="server" class="form-container">
                    <div class="form-group">
                        <label for="email">Email adress</label>
                        <asp:TextBox type="email" class="form-control" id="txt_email" placeholder="Enter your Email" runat="server" required></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="password">Password</label>              
                        <asp:TextBox type="password" class="form-control" id="txt_password" placeholder="Enter your Password" required runat="server"></asp:TextBox>
                    </div>
                    <asp:Button type="submit" class="btn btn-primary btn-block"  runat="server" Text="Login" ID="btn_login" OnClick="btn_login_Click" />
                </form>
            </section>
        </section>
    </section>    
</body>
</html>
