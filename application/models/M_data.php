<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class M_data extends CI_Model {

	public function anggota()
	{
		return $this->db->get('anggota');
	}
	public function user()
	{
		return $this->db->get('user');
	}

	public function simpanan($jenis)
	{
		$this->db->join('anggota','simpanan.simpanan_anggota = anggota.anggota_kode');
		$this->db->where('simpanan_jenis',$jenis);
		$this->db->order_by('simpanan_kode','asc');
		return $this->db->get('simpanan');
	}
	public function simpanan_anggota($anggota,$jenis=null)
	{
		if ($jenis) {
			return $this->db->query("SELECT simpanan_jenis, SUM(simpanan_jumlah) as jumlah 
				FROM `simpanan` 
				WHERE simpanan_anggota = '$anggota' 
				AND simpanan_jenis = '$jenis' ");
		}
		else
		{
			return $this->db->query("SELECT simpanan_anggota, SUM(simpanan_jumlah) as jumlah 
				FROM `simpanan` 
				WHERE simpanan_anggota = '$anggota' ");
		}
		
	} 
	public function pinjaman()
	{
		$this->db->join('anggota','pinjaman.pinjaman_anggota = anggota.anggota_kode');
		$this->db->order_by('pinjaman_kode','asc');
		return $this->db->get('pinjaman');
	} 
	public function pinjaman_anggota($anggota)
	{
		return $this->db->query("SELECT pinjaman_anggota, SUM(pinjaman_jumlah) as jumlah 
			FROM `pinjaman` 
			WHERE pinjaman_anggota = '$anggota' 
			");
	}
	public function pinjaman_detail($id)
	{
		$this->db->join('anggota','pinjaman.pinjaman_anggota = anggota.anggota_kode');
		$this->db->where('pinjaman_kode',$id);
		return $this->db->get('pinjaman');
	} 
	public function cek_kekurangan($id)
	{
		$this->db->join('pinjaman','angsuran.angsuran_pinjaman = pinjaman.pinjaman_kode');
		$this->db->join('anggota','pinjaman.pinjaman_anggota = anggota.anggota_kode');
		$this->db->select('COUNT(angsuran_pinjaman) as total');
		$this->db->select('sum(angsuran_jumlah) as total_bayar');
		$this->db->where('angsuran_pinjaman',$id);
		return $this->db->get('angsuran');
	}
	public function cek_pinjaman($id)
	{
		$this->db->join('pinjaman','angsuran.angsuran_pinjaman = pinjaman.pinjaman_kode');
		$this->db->join('anggota','pinjaman.pinjaman_anggota = anggota.anggota_kode');
		$this->db->select('COUNT(angsuran_pinjaman) as total, pinjaman_tempo');
		$this->db->where('anggota_kode',$id);
		return $this->db->get('angsuran');
	} 
	public function angsuran()
	{
		$this->db->join('pinjaman','angsuran.angsuran_pinjaman = pinjaman.pinjaman_kode');
		$this->db->join('anggota','pinjaman.pinjaman_anggota = anggota.anggota_kode');
		$this->db->order_by('angsuran_waktu','asc');
		return $this->db->get('angsuran');
	} 
	public function angsuran_detail($id)
	{
		$this->db->join('pinjaman','angsuran.angsuran_pinjaman = pinjaman.pinjaman_kode');
		$this->db->join('anggota','pinjaman.pinjaman_anggota = anggota.anggota_kode');
		$this->db->where('angsuran_id', $id);
		return $this->db->get('angsuran');
	}
	public function angsuran_periode($awal,$akhir)
	{
		$this->db->join('pinjaman','angsuran.angsuran_pinjaman = pinjaman.pinjaman_kode');
		$this->db->join('anggota','pinjaman.pinjaman_anggota = anggota.anggota_kode');
		$this->db->where('DATE(angsuran_waktu) >=', $awal);
		$this->db->where('DATE(angsuran_waktu) <=', $akhir);
		$this->db->order_by('angsuran_waktu','asc');
		return $this->db->get('angsuran');
	} 

	public function pinjaman_periode($awal,$akhir)
	{
		$this->db->join('anggota','pinjaman.pinjaman_anggota = anggota.anggota_kode');
		$this->db->where('DATE(pinjaman_waktu) >=', $awal);
		$this->db->where('DATE(pinjaman_waktu) <=', $akhir);
		$this->db->order_by('pinjaman_kode','asc');
		return $this->db->get('pinjaman');
	} 

	public function simpanan_periode($awal,$akhir)
	{
		$this->db->join('anggota','anggota.anggota_kode = simpanan.simpanan_anggota');
		$this->db->where('DATE(simpanan_waktu) >=', $awal);
		$this->db->where('DATE(simpanan_waktu) <=', $akhir);
		$this->db->order_by('simpanan_waktu','asc');
		return $this->db->get('simpanan');
	}

	public function anggota_periode($awal,$akhir)
	{
		$this->db->get('anggota');
		$this->db->where('DATE(tgl_masuk_anggota) >=', $awal);
		$this->db->where('DATE(tgl_masuk_anggota) <=', $akhir);
		$this->db->order_by('tgl_masuk_anggota','asc');
		return $this->db->get('anggota');
	} 
	public function anggota_detail($id)
	{
		$this->db->get('anggota');
		$this->db->where('anggota_nik',$id);
		return $this->db->get('anggota');
	}
	public function simpanan_detail($id)
	{
		$this->db->join('anggota', 'anggota.anggota_kode = simpanan.simpanan_anggota');
		$this->db->where('simpanan_kode',$id);
		return $this->db->get('simpanan');
	}
	public function penarikan_detail($id)
	{
		$this->db->join('anggota', 'anggota.anggota_kode = penarikan.anggota_id');
		$this->db->where('kode',$id);
		return $this->db->get('penarikan');
	}
	public function listNeraca()
	{
		$this->db->select('*');
		$this->db->from('jurnal');
		$this->db->order_by('kode','asc');

		return $this->db->get();
	}

	public function listAkun()
	{
		$this->db->select('*');
		$this->db->from('akun');
		$this->db->order_by('kode','asc');

		return $this->db->get();
	}

	public function listPenarikan()
	{
		$this->db->select('*');
		$this->db->join('anggota','anggota.anggota_kode = penarikan.anggota_id');
		$this->db->from('penarikan');
		$this->db->order_by('kode','asc');

		return $this->db->get();
	}

	public function penarikan_periode($awal,$akhir)
	{
		$this->db->join('anggota','anggota.anggota_kode = penarikan.anggota_id');
		$this->db->where('DATE(created_at) >=', $awal);
		$this->db->where('DATE(created_at) <=', $akhir);
		$this->db->order_by('created_at','asc');
		return $this->db->get('penarikan');
	} 
	
}

/* End of file M_data.php */
/* Location: ./application/models/M_data.php */