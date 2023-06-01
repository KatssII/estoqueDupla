<!DOCTYPE HTML>
<html lang="pt-br">
<head>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="CSS/menu.css"/>
    <title>DEVOLUÇÃO DE ITENS</title>
    <style>
        body {background-color: #473959;}
        .navbar-nav .nav-link {color: #BF7590;}
        .btn {background-color: #918D8A;}

        .button {
            display: inline-block;
            background-color: #4CAF50;
            border: none;
            color: white;
            text-align: center;
            font-size: 16px;
            padding: 10px;
            width: 120px;
            transition: all 0.5s;
            cursor: pointer;
            margin: 5px;
            position: relative;
            overflow: hidden;
        }

        .button span {
            cursor: pointer;
            display: inline-block;
            position: relative;
            transition: 0.5s;
        }

        .button span:after {
            content: '\00bb';
            position: absolute;
            opacity: 0;
            top: 0;
            right: -20px;
            transition: 0.5s;
        }

        .button:hover span {
            padding-right: 25px;
        }

        .button:hover span:after {
            opacity: 1;
            right: 0;
        }
    </style>
</head>
<body style="background-color: #473959;">
<br><br>
    <div class="container">
        <h1 style="text-align:center; font-weight: bold; color: white;">DEVOLUÇÃO DE ITENS</h1>
        <br>
        <form action="" method="post" id="formulario">
            <div class="row justify-content-center">
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="" style="color: white; font-weight: bold;">DATA DA DEVOLUÇÃO</label>
                        <input type="date" name="dataDevolucao" class="form-control">
                    </div>
                    <div class="form-group">
                        <label for="" style="color: white; font-weight: bold;">ITEM DA DEVOLUÇÃO</label>
                        <input type="text" name="itemDevolucao" class="form-control">
                    </div>
                    <div class="form-group">
                        <label for="unidadeDevolucao" style="color: white; font-weight: bold;">UNIDADE</label>
                        <select name="unidadeDevolucao" class="form-control">
                            <option value="caixa">Caixa</option>
                            <option value="pacote">Pacote</option>
                            <option value="avulso">Avulso</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="" style="color: white; font-weight: bold;">QUANTIDADE</label>
                        <input type="number" name="qntdDevolucao" class="form-control">
                    </div>
                    <div class="form-group">
                        <label for="categoriaDevolucao" style="color: white; font-weight: bold;">CATEGORIA</label>
                        <select name="categoriaDevolucao" class="form-control">
                            <option value="ferramenta">Ferramentas</option>
                            <option value="limpeza">Limpeza</option>
                            <option value="pedagogica">Pedagógico</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="" style="color: white; font-weight: bold;">MOTIVO DA DEVOLUÇÃO</label>
                        <input type="text" name="motivoDevolucao" class="form-control">
                    </div>
                    <br>
                    <div class="botoes">
                        <input type="submit" class="button2" value="CADASTRAR" style="margin-right: 10px">
                        <a href="tabela_devolucao.php" type="button" class="button2" style="text-align: center;">TABELA</a>
                    </div>
                </div>
            </div>
        </form>
        <div id="resultado"></div>
    </div>
    <script src="https://code.jquery.com/jquery-3.6.4.js" integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E=" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
    <script>
        $("#formulario").submit(function(event){
            event.preventDefault();
            var dados =  $(this).serialize();
            $.ajax({
                type: 'POST',
                url: 'CRUD/cad_devolucao.php',
                data: dados,
                success: function(data){
                    $("#resultado").html(data);
                }
            });
        });
    </script>
</body>
</html>
