<div class="main-content">
  <section class="section">
    <div class="section-header">
      <h1>Laporan SHU Keseluruhan</h1>
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
                <form method="get" action="<?= base_url('laporan-shu') ?>">
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
              <h5>Laporan SHU Keseluruhan</h5>
              <?= empty($tahunp) ? '' : "<span>Periode Tahun : $tahunp </span>"; ?>
            </div>
            <!-- Settingan SHU -->
            <?php
            $bagAnggota     = $data->pinjaman * 55 / 100;
            $cadangan       = $data->pinjaman * 15 / 100;
            $pendidikan     = $data->pinjaman * 10 / 100;
            $bagPengurus    = $data->pinjaman * 5 / 100;
            $bagPengawas    = $data->pinjaman * 5 / 100;
            $karyawan       = $data->pinjaman * 5 / 100;
            $programSosial  = $data->pinjaman * 3 / 100;
            $programDaerah  = $data->pinjaman * 2 / 100;
            ?>
            <?php
            $shu = $bagAnggota + $cadangan + $pendidikan + $bagPengurus + $bagPengawas + $karyawan + $programSosial + $programDaerah;
            ?>

            <table class="table table-bordered">
              <thead>
                <tr>
                  <th style="width:400px">Dibagi untuk</th>
                  <th style="width: 300px">Presentase SHU</th>
                  <th>Total</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td>Bagian Anggota</td>
                  <td>55%</td>
                  <td>Rp. <?= number_format($bagAnggota) ?></td>
                </tr>
                <tr>
                  <td>Cadangan Koperasi</td>
                  <td>15%</td>
                  <td>Rp. <?= number_format($cadangan) ?></td>
                </tr>
                <tr>
                  <td>Pendidikan</td>
                  <td>10%</td>
                  <td>Rp. <?= number_format($pendidikan) ?></td>
                </tr>
                <tr>
                  <td>Bagian Pengurus</td>
                  <td>5%</td>
                  <td>Rp. <?= number_format($bagPengurus) ?></td>
                </tr>
                <tr>
                  <td>Bagian Pengawas</td>
                  <td>5%</td>
                  <td>Rp. <?= number_format($bagPengawas) ?></td>
                </tr>
                <tr>
                  <td>Bagian Karyawan</td>
                  <td>5%</td>
                  <td>Rp. <?= number_format($karyawan) ?></td>
                </tr>
                <tr>
                  <td>Program Sosial</td>
                  <td>3%</td>
                  <td>Rp. <?= number_format($programSosial) ?></td>
                </tr>
                <tr>
                  <td>Program Pembangunan Daerah Kerja</td>
                  <td>2%</td>
                  <td>Rp. <?= number_format($programDaerah) ?></td>
                </tr>
              </tbody>
              <tfoot>
                <tr>
                  <td colspan="2">Total</td>
                  <td>Rp. <?= number_format($shu) ?></td>
                </tr>
              </tfoot>
            </table>

          </div>
        </div>
      </div>
    </div>
  </section>
</div>