<?php
error_reporting(0);
?>
<div class="main-content">
  <section class="section">
    <div class="section-header">
      <h1>Laporan SHU Perorangan</h1>
      <div class="section-header-breadcrumb">
        <div class="breadcrumb-item active"><a href="<?= base_url('dashboard') ?>">Dashboard</a></div>
        <div class="breadcrumb-item">Laporan</div>
        <div class="breadcrumb-item">SHU</div>
      </div>
    </div>
    <div class="row">
      <div class="col-lg-12">
        <div class="card">
          <div class="card-body">
            <!-- Print -->
            <div class="row">
              <div class="col-md-4">
                <form method="get" action="<?= base_url('laporan-shu-perorangan') ?>">
                  <label>Periode Tahun</label>
                  <div class="input-group">
                    <select class="form-control" name="tahun">
                      <?php foreach ($tgl as $d) : ?>
                        <?php
                        $pecah = explode('-', $d->pinjaman_waktu);
                        $tahun = $pecah[0];
                        ?>
                        <option value="<?= $tahun; ?>" <?= $tahun == date('Y') ? 'selected' : ''; ?>><?= $tahun; ?></option>
                      <?php endforeach ?>
                    </select>
                    <button type="submit" class="btn btn-primary"><i class="fas fa-search"></i></a>
                  </div>
                </form>
              </div>
              <div class="col-md-8">
                <div class="float-right mt-4">
                  <a href="<?= $url_cetak; ?>" target="_blank" class="btn btn-primary btn-lg">
                    <i class="fas fa-print mr-2"></i>Cetak Data
                  </a>
                </div>
              </div>
            </div>
            <div class="text-center mt-2">
              <h1>Koperasi</h1>
              <h5>Laporan SHU Perorangan</h5>
              <?= empty($tahunp) ? '' : "<span>Periode Tahun : $tahunp </span>"; ?>
            </div>
            <table class="table table-bordered mt-3">
              <thead>
                <tr>
                  <th>No Anggota</th>
                  <th>Anggota</th>
                  <th>SHU Simpanan</th>
                  <th>SHU Pinjaman</th>
                  <th>Total</th>
                </tr>
              </thead>
              <tbody>

                <?php
                $total_simpanan = 0;
                $total_pinjaman = 0;
                foreach ($data as $d) {
                  $shu   = $this->data->simpanan_anggota($d->anggota_kode)->row();
                  $pinjaman   = $this->data->pinjaman_anggota($d->anggota_kode)->row();
                  $total_simpanan += $shu->jumlah;
                  $total_pinjaman += $pinjaman->jumlah;
                } ?>

                <?php foreach ($data as $d) : ?>
                  <?php
                  $bagAnggota     = ($d->pinjaman_total - $d->pinjaman_jumlah) * 55 / 100;
                  $cadangan       = ($d->pinjaman_total - $d->pinjaman_jumlah) * 15 / 100;
                  $pendidikan       = ($d->pinjaman_total - $d->pinjaman_jumlah) * 10 / 100;
                  $bagPengurus    = ($d->pinjaman_total - $d->pinjaman_jumlah) * 5 / 100;
                  $bagPengawas     = ($d->pinjaman_total - $d->pinjaman_jumlah) * 5 / 100;
                  $karyawan     = ($d->pinjaman_total - $d->pinjaman_jumlah) * 5 / 100;
                  $programDaerah  = ($d->pinjaman_total - $d->pinjaman_jumlah) * 2 / 100;
                  $programSosial  = ($d->pinjaman_total - $d->pinjaman_jumlah) * 3 / 100;


                  $shu = $bagAnggota + $cadangan + $pendidikan + $bagPengurus + $bagPengawas + $karyawan + $programSosial + $programDaerah;

                  $total_shu = @$total_shu + $shu;
                  ?>
                <?php endforeach ?>
                <?php foreach ($data as $d) : ?>
                  <?php

                  $shu   = $this->data->simpanan_anggota($d->anggota_kode)->row();
                  $pinjaman   = $this->data->pinjaman_anggota($d->anggota_kode)->row();

                  $simpanan_peranggota = $shu->jumlah;
                  $pinjaman_peranggota = $pinjaman->jumlah;

                  // rumus simpanan shu = simpanan peranggota/total_simpanan * 0.4 * total shu
                  $shu_simpanan = $simpanan_peranggota / $total_simpanan * 0.40 * $total_shu;

                  // rumus pinjaman shu = pinjaman peranggota/total_pinjaman * 0.15 * total pinjaman
                  $shu_pinjaman = $pinjaman_peranggota / $total_pinjaman * 0.15 * $total_shu;
                  $total = $shu_simpanan + $shu_pinjaman;
                  $grand_total = @$grand_total + $total;
                  ?>
                  <tr>
                    <td><?= $d->anggota_kode; ?></td>
                    <td><?= $d->anggota_nama; ?></td>
                    <td>Rp. <?= number_format($shu_simpanan); ?></td>
                    <td>Rp. <?= number_format($shu_pinjaman); ?></td>
                    <td>Rp. <?= number_format($total); ?></td>
                  </tr>
                <?php endforeach ?>
                <tr>
                  <th colspan="4" class="text-center">Grand Total</th>
                  <th>Rp. <?= number_format($grand_total); ?></th>
                </tr>
            </table>
          </div>
        </div>
      </div>
    </div>
  </section>
</div>