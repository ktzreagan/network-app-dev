<nav class="navbar col-lg-12 col-12 p-0 fixed-top d-flex flex-row default-layout-navbar">
    <div class="text-center navbar-brand-wrapper d-flex align-items-center justify-content-center">
      <a class="navbar-brand brand-logo" href="index.jsp"><span>NAD Shop</span></a>
      <a class="navbar-brand brand-logo-mini" href="index.jsp">NS</a>
    </div>
    <div class="navbar-menu-wrapper d-flex align-items-stretch">
      <button class="navbar-toggler navbar-toggler align-self-center" type="button" data-toggle="minimize">
        <span class="fas fa-bars"></span>
      </button>
      <ul class="navbar-nav">
        <li class="nav-item nav-search d-none d-md-flex">
          <div class="nav-link">
            <div class="input-group">
              <div class="input-group-prepend">
                <span class="input-group-text">
                  <i class="fas fa-search"></i>
                </span>
              </div>
              <input type="text" class="form-control" placeholder="Search" aria-label="Search">
            </div>
          </div>
        </li>
      </ul>
      <ul class="navbar-nav navbar-nav-right">
       
        <% if(session.getAttribute("customer")!=null||session.getAttribute("admin")!=null) { %>
        <li class="nav-item d-none d-lg-flex">
          <a class="nav-link" href="logout">
            <span class="btn btn-primary">logout</span>
          </a>
        </li>
        <% }else{%>

         <li class="nav-item d-none d-lg-flex">
          <a class="nav-link" href="register">
            <span class="btn btn-primary">Create Account</span>
          </a>
        </li>
          <li class="nav-item d-none d-lg-flex">
          <a class="nav-link" href="login">
            <span class="btn btn-primary">login</span>
          </a>
        </li>

        <%}%>
        <%
        Object itemsStrCount = session.getAttribute("cart_count");
        int cartItemCount = 0;

        if(itemsStrCount!=null){
          cartItemCount = Integer.parseInt(itemsStrCount.toString());
        }
        %>
        <li class="nav-item dropdown">
          <a class="nav-link count-indicator"  href="my_cart">
            <i class="fas fa-shopping-cart mx-0"></i>
            <span class="count"><%=cartItemCount%></span>
          </a>
         
        </li>
  
      </ul>
     
    </div>
  </nav>
