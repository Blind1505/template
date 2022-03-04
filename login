public function proseslogin()
	{
	 $username		= $this->input->post('username');
	 $password		= $this->input->post('password');
	 $passwordmd5	= md5($password);
	 $this->load->model('M_database','',TRUE);
	 $cek 			= $this->M_database->ceklogin($username,$passwordmd5);
	 cek data login dengan database
	 if ($cek)
	  { 
	  foreach ($cek as $c)
	   {
	    $username		= $c['username'];
	    $passwordmd5 	= $c['password'];
		}
		$clog 	= array('username'=>$username, 'password'=>$passwordmd5,'logged_in'=>TRUE);
		$x 		= $this->session->set_userdata($clog);
		echo "<script>
		 {
		  alert('Login berhasil');
		  window.location='admin';
		  }
		  </script>";
	  }
	   else
	    {
		 echo "<script>
				{ alert('Login Gagal !');
					history.go(-1);
				}
			   </script>";
		}
	}
