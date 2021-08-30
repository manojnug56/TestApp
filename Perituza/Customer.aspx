<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Customer.aspx.cs" Inherits="Perituza.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-sweetalert/1.0.1/sweetalert.min.css" integrity="sha512-hwwdtOTYkQwW2sedIsbuP1h0mWeJe/hFOfsvNKpRB3CkRxq8EW7QMheec1Sgd8prYxGm1OM9OZcGW7/GUud5Fw==" crossorigin="anonymous" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-sweetalert/1.0.1/sweetalert.min.js" integrity="sha512-MqEDqB7me8klOYxXXQlB4LaNf9V9S0+sG1i8LtPOYmHqICuEZ9ZLbyV3qIfADg2UJcLyCm4fawNiFvnYbcBJ1w==" crossorigin="anonymous"></script>

    <script>
         //Show error Message
        function error()
        {
            swal("Error", "Invalid Login please check username and password...!", "error");
        }

         //Show error Message
        function warning()
        {
            swal("Error", "User Already Registered..!", "error");
        }

        //Show saved success alert
        function successalert()
        {
            swal("Record Added!", "You Registered a New Customer.!", "success");
        }
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="card">
      <div class="card-header">
        <h3 style="text-align:center;">Customer Registration</h3>
      </div>
      <div class="card-body">
        <blockquote class="blockquote mb-0">
          <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
         <form id="form1"  name="userRegistration" class="form-group">
            <div class="row jumbotron">
                <div class="col-md-6">
                    <label for="inputName">Name</label>
                    <asp:TextBox type="text" class="form-control" id="inputName" placeholder="Enter Customer's Name" runat="server" required></asp:TextBox>
                </div>

                <div class="col-md-6">
                    <label for="inputEmail">Email</label>
                    <asp:TextBox runat="server" type="email" class="form-control" id="inputEmail" placeholder="Enter Customer's Email" required></asp:TextBox>
                </div>

                <div class="col-md-6">
                    <label for="inputAdress">Adress</label>
                    <asp:TextBox runat="server" type="text" class="form-control" id="inputAdress" placeholder="Enter Customer's Adress"></asp:TextBox>
                </div>

                <div class="col-md-6">
                    <label for="inputPhone">Phone</label>
                    <asp:TextBox runat="server" type="tel" class="form-control" id="inputPhone" placeholder="Enter Customer's Phone Number" pattern="[0-9]{3} [0-9]{3}-[0-9]{4}"></asp:TextBox>
                    <small>Format: (XXX) XXX-XXXX</small><br/><br/>

                     <div class="d-grid gap-2 d-md-block">
                      <input class="btn btn-danger"  type="reset" value="Reset">
                      <asp:Button class="btn btn-primary" type="submit" runat="server" Text="Register" ID="btn_reg" OnClick="btn_reg_Click" />
                    </div>
                </div>
            </div>

             <div class="row jumbotron">
            <div style ="height:200px; width:100%; overflow:auto;">
            <asp:GridView ID="dtg_cus" runat="server" AutoGenerateColumns="False" Width="100%" CssClass="table table-hover table-striped table-responsive" OnSelectedIndexChanged="dtg_cus_SelectedIndexChanged">
                <Columns>
                    <asp:BoundField HeaderText="Id" ItemStyle-Width = "200px" DataField="id" />
                    <asp:BoundField HeaderText="Name" ItemStyle-Width = "200px" DataField="name" />
                    <asp:BoundField HeaderText="Email" ItemStyle-Width = "200px" DataField="email" />
                    <asp:BoundField HeaderText="Adress" ItemStyle-Width = "200px" DataField="address" />
                    <asp:BoundField HeaderText="Phone" ItemStyle-Width = "200px" DataField="phone" />
                    <asp:BoundField HeaderText="Date" ItemStyle-Width = "200px" DataField="date" />
                </Columns>
            </asp:GridView>
        </div>
        </div>
        </form>
    </div>     
          <footer class="blockquote-footer">Manoj Udagedaraa <cite title="Source Title">Perituza</cite></footer>
        </blockquote>
     
    </div>

    <div class="container">
        
    </div>
</asp:Content>
