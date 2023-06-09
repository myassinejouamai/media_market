<?php

ob_start();
// php
$title = "coupons";

$coupons = $pdo->query("SELECT * FROM coupon_code ORDER BY id DESC;")->fetchAll();

// dd($coupons);


if (isset($_POST['coupon_add'])) {

    if (empty($_POST['nom']) || !preg_match('/^[a-zA-Z]+$/', $_POST['nom'])) {
        $errors["nom"] = "Votre nom n'est pas valide";
        $nom_class_input = "is-invalid";
        $nom_class_feedback = "invalid-feedback";
    } else {
        $nom_class_input = "is-valid";
        $nom_class_feedback = "valid-feedback";
    }

    if (empty($_POST['montant'])) {
        $errors["montant"] = "Votre Montant n'est pas valide";
        $montant_class_input = "is-invalid";
        $montant_class_feedback = "invalid-feedback";
    } else {
        $montant_class_input = "is-valid";
        $montant_class_feedback = "valid-feedback";
    }

    if (empty($errors)) {

        $nom = _string($_POST['nom']);
        $montant = floatval($_POST['montant']);
        $req = $pdo->prepare("INSERT INTO coupon_code SET
            nom = ?,
            montant = ?
         ");
        $req->execute(
            [
                $nom,
                $montant
            ]
        );
        // $user_id = $pdo->lastInsertId();

        $_SESSION['flash']['success'] = 'Bien enregister';
        header('Location: coupons');
        exit();
    }
}

if (isset($_POST['coupon_update'])) {



    if (empty($_POST['nom']) || !preg_match('/^[a-zA-Z]+$/', $_POST['nom'])) {
        $errors["nom"] = "Votre nom n'est pas valide";
        $nom_class_input = "is-invalid";
        $nom_class_feedback = "invalid-feedback";
    } else {
        $nom_class_input = "is-valid";
        $nom_class_feedback = "valid-feedback";
    }


    // var_dump($montant);
    // die();

    if (empty($_POST['montant'])) {
        $errors["montant"] = "Votre Montant n'est pas valide";
        $montant_class_input = "is-invalid";
        $montant_class_feedback = "invalid-feedback";
    } else {
        $montant_class_input = "is-valid";
        $montant_class_feedback = "valid-feedback";
    }


    $id = (int)$_POST['coupon_id'];

    if (empty($errors)) {
        $nom = _string($_POST['nom']);
        $montant = floatval($_POST['montant']);

        $req = $pdo->prepare("UPDATE coupon_code SET
            nom = :nom,
            montant = :montant
            WHERE id = :id
         ");
        $req_execute = $req->execute(
            [
                'nom' => $nom,
                'montant' => $montant,
                'id' => $id
            ]
        );
        // $user_id = $pdo->lastInsertId();

        $_SESSION['flash']['success'] = 'Bien modifier';
        header('Location: coupons');
        exit();
    }
}

if (isset($_POST['coupon_desactivated'])) {
    $id = (int)$_POST['coupon_id'];
    $pdo->query("UPDATE coupon_code SET activated = 0 WHERE id = $id");
    $_SESSION['flash']['success'] = 'Bien désactivé';
    header('Location: coupons');
    die();
}

if (isset($_POST['coupon_activated'])) {
    $id = (int)$_POST['coupon_id'];
    $pdo->query("UPDATE coupon_code SET activated = 1 WHERE id = $id");
    $_SESSION['flash']['success'] = 'Bien désactivé';
    header('Location: coupons');
    die();
}

$content_php = ob_get_clean();

ob_start(); ?>

<h3>Coupons code</h3>


<div class="card shadow-sm">
    <div class="card-header">
        <h4>Liste des coupons codes</h4>
    </div>

    <div class="card-body">

        <?php if (!empty($errors)) : ?>
            <div class="alert alert-danger shadow mb-4">
                <h6>
                    <lord-icon src="https://cdn.lordicon.com/tdrtiskw.json" trigger="loop" colors="primary:#121331,secondary:#ed1c24" stroke="75" scale="40" style="width:50px;height:50px">
                    </lord-icon>
                    Vous n'avez pas rempli le formulaire correctement
                </h6>

                <ul class="list-group list-group-flush">
                    <?php foreach ($errors as $key => $e) : ?>
                        <li class="list-group-item bg-transparent">
                            <b><?= ucfirst($key) ?></b> - <?= $e ?>
                        </li>
                    <?php endforeach ?>
                </ul>
            </div>
        <?php endif ?>


        <button type="button" class="btn btn-primary mb-3" data-bs-toggle="modal" data-bs-target="#coupon_add">
            <i class="fas fa-plus"></i>
            Ajouter
        </button>

        <div class="modal fade" id="coupon_add" tabindex="-1" aria-labelledby="coupon_addLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <h6 class="modal-title" id="coupon_addLabel">
                            <i class="fas fa-plus"></i> Ajouter un coupon
                        </h6>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <form method="post" autocomplete="off">
                        <div class="modal-body">
                            <div class="row">

                                <div class="col-md-4">
                                    <div class="form-group mb-3">
                                        <label class="form-label" for="nom">Nom:</label>

                                        <input name="nom" type="text" class="form-control <?= $nom_class_input ?? "" ?>" id="nom" placeholder="Nom:" value="<?= $_POST['nom'] ?? "" ?>">

                                        <div class="<?= $nom_class_feedback ?? "" ?> fw-bold">
                                            <?= $errors['nom'] ?? "" ?>
                                        </div>
                                    </div>
                                </div>
                                <!-- col -->

                                <div class="col-md-4">
                                    <div class="form-group mb-3">
                                        <label class="form-label" for="email">Montant:</label>

                                        <input name="montant" type="text" class="form-control <?= $montant_class_input ?? "" ?>" id="montant" name="montant" placeholder="Montant:" value="<?= $_POST['montant'] ?? "" ?>">

                                        <div class="<?= $montant_class_feedback ?? "" ?> fw-bold">
                                            <?= $errors['montant'] ?? "" ?>
                                        </div>
                                    </div>
                                </div>
                                <!-- col -->

                            </div>
                            <!-- row -->

                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">
                                <i class="fas fa-undo"></i>
                                Retour
                            </button>
                            <button type="submit" name="coupon_add" class="btn btn-primary">
                                <i class="fas fa-plus"></i>
                                Ajouter
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <div class="table-responsive">

            <table class="table table-bordered table-hover table-sm table-striped">
                <thead>
                    <tr>
                        <th>Id</th>
                        <th>Nom</th>
                        <th>Montant</th>
                        <th>Status</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <?php foreach ($coupons as $key => $r) : ?>
                        <tr>
                            <th>
                                <?= $r->id ?>
                            </th>

                            <td>
                                <?= strtoupper($r->nom) ?>
                            </td>

                            <td>
                                <?= $r->montant ?>
                            </td>
                            <td>

                                <span class=" text-<?= $r->activated ? "success" : "danger" ?>">
                                    <i class="fas fa-<?= $r->activated ? "check-circle" : "times-circle" ?>"></i>
                                </span>

                            </td>
                            <td>


                                <button type="button" class="btn btn-outline-dark fw-bold btn-sm" data-bs-toggle="modal" data-bs-target="#coupon_update_<?= $r->id ?>">
                                    <i class="fas fa-wrench"></i>
                                    Modifier
                                </button>

                                <div class="modal fade" id="coupon_update_<?= $r->id ?>" tabindex="-1" aria-labelledby="coupon_update_<?= $r->id ?>Label" aria-hidden="true">
                                    <div class="modal-dialog modal-lg">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h6 class="modal-title" id="coupon_update_<?= $r->id ?>Label">
                                                    <i class="fas fa-wrench"></i>
                                                    Modifier <?= strtolower($r->nom) ?>
                                                </h6>
                                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                            </div>
                                            <form method="post">
                                                <div class="modal-body">

                                                    <div class="row">

                                                        <div class="col-md-4">
                                                            <div class="form-group mb-3">
                                                                <label class="form-label" for="nom">Nom:</label>

                                                                <input name="nom" type="text" class="form-control" id="nom" placeholder="Nom:" value="<?= strtoupper($r->nom) ?>">

                                                            </div>
                                                        </div>
                                                        <!-- col -->

                                                        <div class="col-md-4">
                                                            <div class="form-group mb-3">
                                                                <label class="form-label" for="email">Montant:</label>

                                                                <input name="montant" type="text" class="form-control" id="montant" name="montant" placeholder="Montant:" value="<?= $r->montant ?>">

                                                            </div>
                                                        </div>
                                                        <!-- col -->


                                                    </div>
                                                    <!-- row -->
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">
                                                        <i class="fas fa-undo"></i>
                                                        Retour
                                                    </button>
                                                    <input type="hidden" name="coupon_id" value="<?= $r->id ?>">
                                                    <button type="submit" name="coupon_update" class="btn btn-dark">
                                                        <i class="fas fa-wrench"></i>
                                                        Modifier
                                                    </button>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>


                                <?php if ($r->activated == 1) : ?>

                                    <button type="button" class="btn btn-outline-danger fw-bold btn-sm" data-bs-toggle="modal" data-bs-target="#coupon_desactivated_<?= $r->id ?>">
                                        <i class="fas fa-trash-alt"></i>
                                        Désactivé
                                    </button>

                                    <div class="modal fade" id="coupon_desactivated_<?= $r->id ?>" tabindex="-1" aria-labelledby="label_<?= $r->id ?>" aria-hidden="true">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="label_<?= $r->id ?>">
                                                        <i class="fas fa-trash-alt"></i>
                                                        Désactivé
                                                    </h5>
                                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                </div>
                                                <div class="modal-body">
                                                    <div class="text-danger fw-bold h5"> Voulez vous vraiment désactiver <?= ucfirst($r->nom) ?> ?</div>
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">
                                                        <i class="fas fa-undo"></i>
                                                        Retour
                                                    </button>

                                                    <form method="post" style="display: inline;">
                                                        <input type="hidden" name="coupon_id" value="<?= $r->id ?>">
                                                        <button name="coupon_desactivated" type="submit" class="btn btn-danger">
                                                            <i class="fas fa-trash-alt"></i>
                                                            Desactivé
                                                        </button>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                <?php else : ?>
                                    <button type="button" class="btn btn-outline-success fw-bold btn-sm" data-bs-toggle="modal" data-bs-target="#coupon_activated_<?= $r->id ?>">
                                        <i class="fas fa-trash-alt"></i>
                                        Activé
                                    </button>

                                    <div class="modal fade" id="coupon_activated_<?= $r->id ?>" tabindex="-1" aria-labelledby="label_<?= $r->id ?>" aria-hidden="true">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="label_<?= $r->id ?>">
                                                        <i class="fas fa-trash-alt"></i>
                                                        Activé
                                                    </h5>
                                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                </div>
                                                <div class="modal-body">
                                                    <div class="text-success fw-bold h5"> Voulez vous vraiment activé <?= ucfirst($r->nom) ?> ?</div>
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">
                                                        <i class="fas fa-undo"></i>
                                                        Retour
                                                    </button>

                                                    <form method="post" style="display: inline;">
                                                        <input type="hidden" name="coupon_id" value="<?= $r->id ?>">
                                                        <button name="coupon_activated" type="submit" class="btn btn-success">
                                                            <i class="fas fa-trash-alt"></i>
                                                            Activé
                                                        </button>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                <?php endif ?>








                            </td>
                        </tr>
                    <?php endforeach  ?>

                </tbody>
            </table>
        </div>
    </div>
</div>


<?php $content_html = ob_get_clean(); ?>