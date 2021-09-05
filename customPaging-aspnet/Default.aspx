<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="customPaging_aspnet._Default" %>


<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <style type="text/css">
        .page_enabled {
            background-color: #007AFE;
            color: #FFFFFF;
        }
    </style>
    <div style="margin-top: 10px;">
        PageSize:
        <asp:DropDownList ID="ddlPageSize" runat="server" AutoPostBack="true" OnSelectedIndexChanged="PageSize_Changed">
            <asp:ListItem Text="10" Value="10" />
            <asp:ListItem Text="25" Value="25" />
            <asp:ListItem Text="50" Value="50" />
        </asp:DropDownList>
    </div>
    <asp:GridView ID="grd_Customers" runat="server" AutoGenerateColumns="false" CssClass="table table-bordered">
        <Columns>
            <asp:BoundField HeaderText="Customer Id" DataField="customer_id" ItemStyle-Width="100" />
            <asp:BoundField HeaderText="Name" DataField="first_name" ItemStyle-Width="100" />
            <asp:BoundField HeaderText="Street" DataField="street" ItemStyle-Width="100" />
            <asp:BoundField HeaderText="City" DataField="city" ItemStyle-Width="100" />
            <asp:BoundField HeaderText="State" DataField="state" ItemStyle-Width="100" />
        </Columns>
    </asp:GridView>
    <ul class="pagination">
        <asp:Repeater ID="rptPager" runat="server">
            <ItemTemplate>
                <li class="page-item">
                    <asp:LinkButton ID="LinkButton1" runat="server" Text='<%#Eval("Text") %>' CommandArgument='<%# Eval("Value") %>'
                        CssClass='<%# Convert.ToBoolean(Eval("Enabled")) ? "page-link" : "page-link page_enabled" %>'
                        OnClick="Page_Changed" OnClientClick='<%# !Convert.ToBoolean(Eval("Enabled")) ? "return false;" : "" %>'></asp:LinkButton>
                </li>
            </ItemTemplate>
        </asp:Repeater>
    </ul>

</asp:Content>
