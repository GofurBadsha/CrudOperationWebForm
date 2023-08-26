<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="Employee.aspx.cs" Inherits="CrudOperationDemoApp.Employee" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<asp:Content runat="server" ContentPlaceHolderID="header" ID="header" >
        
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="MainContent" ID="testid">
    <script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
    <contenttemplate>
        <div class="row">
            <div class="col-md-4"></div>
            <div class="col-md-4" style="margin-top: 20px">
                <asp:HiddenField ID="EmployeeId" runat="server" />
                <div class="form-group">
                    <asp:Label ID="lblName" runat="server" Text="">Employee Name :</asp:Label>
                    <asp:TextBox ID="txtName" runat="server" class="form-control"></asp:TextBox>
                </div>
                <div class="form-group">
                    <asp:Label ID="lblDepartment" runat="server" Text="Label">Department :</asp:Label>
                    <asp:TextBox ID="txtDepartment" class="form-control" runat="server"></asp:TextBox>
                </div>
                <div class="form-group">
                    <asp:Label ID="lblAddress" runat="server" Text="Label">Adress :</asp:Label>
                    <asp:TextBox ID="txtAdress" class="form-control" runat="server"></asp:TextBox>
                </div>
                <div class="form-group">
                    <asp:Label ID="lblContactNo" runat="server" Text="Label">Phone Number:</asp:Label>
                    <asp:TextBox ID="txtCotactNo" class="form-control" runat="server" TextMode="Number"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Please enter 11 digit phone no." ForeColor="Red" ControlToValidate="txtCotactNo" ValidationExpression="^(\+\d{1,2}\s)?\(?\d{3}\)?[\s.-]?\d{3}[\s.-]?\d{5}$"></asp:RegularExpressionValidator><br />
                    <%--<asp:RequiredFieldValidator runat="server" ControlToValidate="txtCotactNo" ErrorMessage="Please enter your phone number." ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>--%>
                </div>
                <div class="form-group">
                    <asp:Label ID="lblSalary" runat="server" Text="Label">Salary :</asp:Label>
                    <asp:TextBox ID="txtSalary" class="form-control" runat="server" TextMode="Number"></asp:TextBox>
                    <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="txtSalary" runat="server" ErrorMessage="Enter Salary" ForeColor="Red"></asp:RequiredFieldValidator>--%>
                </div>
                <div class="row">
                    <div class="col-md-3">
                        <asp:Button ID="btnSave" class="btn btn-primary" runat="server" Text="Save" Width="104px" OnClick="btnSave_Click" />
                    </div>
                    <div class="col-md-9" style="top: 8px; left: 20px">
                        <asp:Label ID="lblSeuccessMessage" Visible="false" runat="server" class="alert alert-success" role="alert" Text=""></asp:Label>
                        <asp:Label ID="lblEroreMessage" runat="server" class="alert-danger" Text=""></asp:Label>
                    </div>
                </div>
            </div>
            <div class="col-md-4"></div>
           
        </div>
        <div class="row">
             <div class="row">
                <div class="col-8">
                    <asp:TextBox ID="txtSearch" runat="server" Height="33px" Width="298px"></asp:TextBox>
                </div>
                <div class="col-4">
                    <asp:Button ID="btnSearch" class="btn btn-success" style="margin-top:5px" runat="server" Text="Search" OnClick="btnSearch_Click" Width="119px" />
                </div>
            </div>
            <div class="table table-striped table-hover table-responsive" runat="server">
                <asp:GridView ID="gvEployee" OnRowCancelingEdit="gvEployee_RowCancelingEdit" OnRowEditing="gridviewRowEditing" OnRowUpdating="GridView_RowUpdating" class="table table-striped" runat="server" Style="margin-top: 20px !important" Height="94px" Width="100%" HeaderStyle-BackColor="#3AC0F2" AutoGenerateColumns="false" HeaderStyle-ForeColor="White">

                    <Columns>
                        <asp:TemplateField HeaderText="Employee Id" ItemStyle-Width="100px" Visible="false">
                            <ItemTemplate>
                                <asp:Label runat="server" ID="textRowEmployeeId" Text='<%# Convert.ToString(DataBinder.Eval(Container.DataItem,"EmployeeId"))%>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Employee Name">
                            <ItemTemplate>
                                <asp:Label runat="server" ID="textRowEmployeeName" Text='<%# Convert.ToString(DataBinder.Eval(Container.DataItem,"EmployeeName"))%>' />
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="textRowEmployeeName" Text='<%# Eval("EmployeeName")%>' runat="server" CssClass="edit-textbox-dona" />
                            </EditItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Employee Department">
                            <ItemTemplate>
                                <asp:Label runat="server" ID="textRowEmployeeDepartment" Text='<%# Convert.ToString(DataBinder.Eval(Container.DataItem,"EmployeeDepartment"))%>' />
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="textRowEmployeeDepartment" Text='<%# Eval("EmployeeDepartment") %>' runat="server"></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Employee Address">
                            <ItemTemplate>
                                <asp:Label runat="server" ID="textRowEmployeeAdress" Text='<%# Convert.ToString(DataBinder.Eval(Container.DataItem,"EmployeeAdress"))%>' />
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="textRowEmployeeAdress" Text='<%# Eval("EmployeeAdress") %>' runat="server"></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Employee Contact No" ItemStyle-Width="165px">
                            <ItemTemplate>
                                <asp:Label runat="server" ID="textRowEmployeeContactNo" Text='<%# Convert.ToString(DataBinder.Eval(Container.DataItem,"EmployeeContactNo"))%>' />
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="textRowEmployeeContactNo" Text='<%# Eval("EmployeeContactNo") %>' runat="server" TextMode="Number"></asp:TextBox>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidatorGvContactNo" runat="server" ErrorMessage="Please enter 11 digit phone no." ForeColor="Red" ControlToValidate="textRowEmployeeContactNo" ValidationExpression="^(\+\d{1,2}\s)?\(?\d{3}\)?[\s.-]?\d{3}[\s.-]?\d{5}$"></asp:RegularExpressionValidator><br />
                            </EditItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Employee Salary" ItemStyle-Width="135px">
                            <ItemTemplate>
                                <asp:Label runat="server" ID="textRowEmployeeSalary" Text='<%# Convert.ToString(DataBinder.Eval(Container.DataItem,"EmployeeSalary"))%>' />
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="textRowEmployeeSalary" Width="100px" Text='<%# Eval("EmployeeSalary") %>' runat="server" TextMode="Number"></asp:TextBox>

                            </EditItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:Button ID="editB" runat="server" class="btn btn-success" CommandName="Edit" Text="Edit"></asp:Button>
                                <asp:Button ID="upB" runat="server" class="btn btn-warning" CommandName="Update" Text="Update"></asp:Button>
                                <asp:LinkButton ID="DeleteIconButoon" runat="server" CommandArgument='<%# Eval("EmployeeId") %>' OnClick="btnDelete_Click" class="btn btn-danger"><i class="far fa-trash-alt">Delete</i></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
                <div style="text-align:right">
                    <ul class="pagination justify-content-end">
                        <li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
                        <li class="page-item"><a class="page-link" href="#">1</a></li>
                        <li class="page-item"><a class="page-link" href="#">2</a></li>
                        <li class="page-item"><a class="page-link" href="#">3</a></li>
                        <li class="page-item"><a class="page-link" href="#">Next</a></li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="row">
            <asp:Button ID="btnReport" runat="server" Text="Employee Report" OnClick="btnReport_Click" />
            <rsweb:ReportViewer ID="ReportViewer1" runat="server" BackColor="" ClientIDMode="AutoID" HighlightBackgroundColor="" InternalBorderColor="204, 204, 204" InternalBorderStyle="Solid" InternalBorderWidth="1px" LinkActiveColor="" LinkActiveHoverColor="" LinkDisabledColor="" PrimaryButtonBackgroundColor="" PrimaryButtonForegroundColor="" PrimaryButtonHoverBackgroundColor="" PrimaryButtonHoverForegroundColor="" SecondaryButtonBackgroundColor="" SecondaryButtonForegroundColor="" SecondaryButtonHoverBackgroundColor="" SecondaryButtonHoverForegroundColor="" SplitterBackColor="" ToolbarDividerColor="" ToolbarForegroundColor="" ToolbarForegroundDisabledColor="" ToolbarHoverBackgroundColor="" ToolbarHoverForegroundColor="" ToolBarItemBorderColor="" ToolBarItemBorderStyle="Solid" ToolBarItemBorderWidth="1px" ToolBarItemHoverBackColor="" ToolBarItemPressedBorderColor="51, 102, 153" ToolBarItemPressedBorderStyle="Solid" ToolBarItemPressedBorderWidth="1px" ToolBarItemPressedHoverBackColor="153, 187, 226" Width="693px">
                <%--<LocalReport ReportPath="Employee.rdlc">
                </LocalReport>--%>
            </rsweb:ReportViewer>
        </div>
    </contenttemplate>
</asp:Content>


    