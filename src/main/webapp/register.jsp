<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Registro | Rock Legends</title>

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        /* Base */
        :root{
            --accent-1: #b5179e; /* magenta / rock accent */
            --accent-2: #4cc9f0; /* cyan secondary */
            --bg-dark: #0b0710;
            --card-bg: rgba(255,255,255,0.04);
            --muted: #cbd5e1;
        }
        html,body{height:100%}
        body{
            margin:0;
            font-family: 'Poppins', sans-serif;
            background:
              radial-gradient(1200px 600px at 10% 10%, rgba(181,23,158,0.08), transparent 8%),
              radial-gradient(1000px 500px at 90% 90%, rgba(76,201,240,0.04), transparent 10%),
              linear-gradient(180deg,#0f0b14 0%, #14101a 60%);
            color: #eef2ff;
            display:flex;
            flex-direction:column;
            align-items:center;
        }

        /* Header */
        header{
            width:100%;
            max-width:1100px;
            padding:28px 20px;
            display:flex;
            align-items:center;
            justify-content:space-between;
            gap:20px;
        }
        .brand {
            display:flex;
            gap:12px;
            align-items:center;
            color:var(--accent-1);
            text-decoration:none;
        }
        .brand .logo {
            width:54px;
            height:54px;
            border-radius:12px;
            background: linear-gradient(135deg,var(--accent-1), #7209b7);
            display:flex;
            align-items:center;
            justify-content:center;
            box-shadow: 0 8px 30px rgba(181,23,158,0.14);
            font-weight:900;
            font-size:20px;
        }
        .brand h1{
            margin:0;
            font-size:1.35rem;
            letter-spacing:0.6px;
        }
        .brand small{display:block;font-size:0.75rem;color:var(--muted);margin-top:2px}

        /* Card */
        .register-wrap{
            width:100%;
            max-width:980px;
            margin:18px;
            display:grid;
            grid-template-columns: 1fr 440px;
            gap:28px;
            align-items:center;
        }

        .panel-left{
            padding:36px;
            border-radius:16px;
            background: linear-gradient(180deg, rgba(255,255,255,0.02), rgba(255,255,255,0.01));
            box-shadow: 0 12px 40px rgba(7,6,10,0.6);
            border:1px solid rgba(255,255,255,0.03);
            color: #f8f9ff;
        }

        .panel-left h2{
            margin:0 0 12px 0;
            font-size:1.6rem;
            color:var(--accent-1);
        }
        .panel-left p.lead{
            margin:0 0 18px 0;
            color:#dfe9f8;
            opacity:0.9;
        }
        .features{
            display:grid;
            grid-template-columns: repeat(2, minmax(0,1fr));
            gap:14px;
            margin-top:18px;
        }
        .feature{
            background: linear-gradient(180deg, rgba(255,255,255,0.01), transparent);
            border-radius:12px;
            padding:12px;
            display:flex;
            gap:12px;
            align-items:flex-start;
            border:1px solid rgba(255,255,255,0.02);
        }
        .feature .ico{
            width:44px;height:44px;border-radius:10px;
            background: rgba(255,255,255,0.03);
            display:flex;align-items:center;justify-content:center;font-weight:700;color:var(--accent-2);
            box-shadow: 0 6px 18px rgba(76,201,240,0.06);
        }
        .feature h4{margin:0;font-size:0.98rem}
        .feature small{color:var(--muted)}

        /* Right form card */
        .register-box{
            background: linear-gradient(180deg, rgba(255,255,255,0.02), rgba(255,255,255,0.01));
            backdrop-filter: blur(6px);
            border-radius:16px;
            padding:28px;
            width:100%;
            border: 1px solid rgba(255,255,255,0.04);
            box-shadow: 0 10px 30px rgba(0,0,0,0.5);
        }

        .register-box h3{
            color:#fff;
            margin:0 0 6px 0;
            font-size:1.25rem;
        }
        .register-box .subtitle{
            color:var(--muted);
            margin-bottom:16px;
            font-size:0.95rem;
        }

        .form-control{
            border-radius:12px;
            padding:12px 14px;
            background: rgba(255,255,255,0.02);
            border:1px solid rgba(255,255,255,0.06);
            color:#eef2ff;
        }
        .form-control::placeholder{color: rgba(238,242,255,0.5)}
        .form-control:focus{
            border-color: var(--accent-1);
            box-shadow: 0 6px 20px rgba(181,23,158,0.12);
            background: rgba(255,255,255,0.025);
            color:#fff;
            outline: none;
        }

        label.form-label{ color: #e6eefc; font-weight:600; font-size:0.92rem; }

        .divider{
            height:3px;
            width:72px;
            background: linear-gradient(90deg,var(--accent-1), var(--accent-2));
            border-radius:6px;
            margin:10px 0 18px 0;
            box-shadow: 0 6px 20px rgba(181,23,158,0.08);
        }

        .btn-register{
            border-radius: 28px;
            padding: 12px 18px;
            font-weight:700;
            letter-spacing:0.6px;
            background: linear-gradient(90deg,var(--accent-1), #8b2ab0);
            border: none;
            color:#fff;
            box-shadow: 0 10px 30px rgba(181,23,158,0.14);
            transition: transform .15s ease, box-shadow .15s ease;
        }
        .btn-register:hover{ transform: translateY(-3px) scale(1.01); box-shadow: 0 18px 40px rgba(181,23,158,0.20); }

        .small-muted{ color:var(--muted); font-size:0.86rem; }

        /* social buttons (visual, non-functional) */
        .social-row{ display:flex; gap:10px; margin-top:12px; }
        .social-btn{
            flex:1;
            border-radius:12px;
            padding:8px;
            border:1px solid rgba(255,255,255,0.04);
            background: rgba(255,255,255,0.015);
            color:var(--muted);
            display:flex;align-items:center;justify-content:center;gap:8px;
            cursor:pointer;
        }
        .social-btn:hover{ background: rgba(255,255,255,0.02); color:#fff; }

        /* helper */
        .helper { margin-top:12px; color:var(--muted); font-size:0.87rem; }

        /* responsive */
        @media (max-width: 980px){
            .register-wrap{ grid-template-columns: 1fr; padding: 18px; }
            header{ padding:18px; justify-content:center; }
            .brand h1{ display:none; } /* compact */
        }
    </style>
</head>
<body>

<header>
    <a href="<%=request.getContextPath()%>/index.jsp" class="brand">
        <div class="logo">RL</div>
        <div>
            <h1>Rock Legends</h1>
            <small>La comunidad donde las leyendas se encuentran</small>
        </div>
    </a>
    <div style="display:flex; gap:10px; align-items:center;">
        <a href="<%=request.getContextPath()%>/login.jsp" class="btn btn-sm" style="background:transparent; color:var(--accent-2); border:1px solid rgba(76,201,240,0.12);">Iniciar sesión</a>
    </div>
</header>

<section class="register-wrap">

    <!-- LEFT INFO / HERO -->
    <div class="panel-left">
        <h2>Únete al círculo</h2>
        <p class="lead">Comparte riffs, descubre bandas, participa en foros y organiza encuentros. Crea tu perfil y sé parte del legado.</p>

        <div class="features">
            <div class="feature">
                <div class="ico">🎤</div>
                <div>
                    <h4>Foros vibrantes</h4>
                    <small>Debates en tiempo real sobre albums, giras y gear.</small>
                </div>
            </div>

            <div class="feature">
                <div class="ico">🤝</div>
                <div>
                    <h4>Conexión real</h4>
                    <small>Encuentra fans y coordina quedadas o conciertos locales.</small>
                </div>
            </div>

            <div class="feature">
                <div class="ico">🧭</div>
                <div>
                    <h4>Comunidades</h4>
                    <small>Crea o únete a comunidades temáticas por subgénero.</small>
                </div>
            </div>

            <div class="feature">
                <div class="ico">🔒</div>
                <div>
                    <h4>Moderación humana</h4>
                    <small>Normas claras y moderadores para mantener el respeto.</small>
                </div>
            </div>
        </div>

        <p class="helper">Al registrarte aceptas nuestras normas de la comunidad. Sé respetuoso con otros fans — el rock es para todos.</p>
    </div>

    <!-- RIGHT FORM -->
    <aside class="register-box">
        <h3>Crear una cuenta</h3>
        <div class="subtitle">Regístrate y comienza a compartir tu pasión por el rock.</div>
        <div class="divider"></div>

        <form action="<%=request.getContextPath()%>/register" method="post" novalidate>

            <div class="mb-3">
                <label for="username" class="form-label">Nombre de usuario</label>
                <input type="text" class="form-control" id="username" name="username"
                       required placeholder="Ej: rockfan2025" autocomplete="username">
            </div>

            <div class="mb-3">
                <label for="email" class="form-label">Correo electrónico</label>
                <input type="email" class="form-control" id="email" name="email"
                       required placeholder="tu@email.com" autocomplete="email">
            </div>

            <div class="mb-3 password-wrapper">
                <label for="password" class="form-label">Contraseña</label>
                <input type="password" class="form-control" id="password" name="password"
                       required placeholder="********" autocomplete="new-password">
                <span class="toggle-password" onclick="togglePass()">Mostrar</span>
            </div>

            <!-- opcional: terms -->
            <div class="mb-3 form-check">
                <input type="checkbox" class="form-check-input" id="terms" required>
                <label class="form-check-label small-muted" for="terms">Acepto las <a href="#" style="color:var(--accent-2);">normas de la comunidad</a> y la política de privacidad.</label>
            </div>

            <% if (request.getAttribute("error") != null) { %>
                <div class="alert alert-danger text-center">
                    <%= request.getAttribute("error") %>
                </div>
            <% } %>

            <button type="submit" class="btn-register w-100">Registrarme</button>

            <div class="social-row" style="margin-top:16px;">
                <div class="social-btn">🔗 Continuar con Google</div>
                <div class="social-btn">🟦 Continuar con GitHub</div>
            </div>

            <p class="text-center helper" style="margin-top:14px;">
                ¿Ya tienes cuenta? <a href="<%=request.getContextPath()%>/login.jsp" style="color:var(--accent-2);">Inicia sesión</a>
            </p>
        </form>
    </aside>

</section>

<footer style="width:100%;max-width:1100px;padding:18px 20px;margin-bottom:18px;color:var(--muted);">
    <jsp:include page="/footer.jsp" />
</footer>

<script>
    function togglePass(){
        const p = document.getElementById('password');
        const t = document.querySelector('.toggle-password');
        if(!p) return;
        if(p.type === 'password'){ p.type='text'; t.innerText='Ocultar'; }
        else { p.type='password'; t.innerText='Mostrar'; }
    }
</script>

</body>
</html>
