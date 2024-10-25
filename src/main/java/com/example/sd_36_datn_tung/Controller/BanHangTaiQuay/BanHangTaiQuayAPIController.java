    package com.example.sd_36_datn_tung.Controller.BanHangTaiQuay;


    import com.example.sd_36_datn_tung.Model.*;
    import com.example.sd_36_datn_tung.Service.GiamGia.ChuongTrinhGiamGiaChiTietGiayTheThaoService;
    import com.example.sd_36_datn_tung.Service.GiamGia.ChuongTrinhGiamGiaChiTietHoaDonService;
    import com.example.sd_36_datn_tung.Service.GiamGia.ChuongTrinhGiamGiaHoaDonService;
    import com.example.sd_36_datn_tung.Service.GiayTheThao.GiayTheThaoChiTietService;
    import com.example.sd_36_datn_tung.Service.GiayTheThao.GiayTheThaoService;
    import com.example.sd_36_datn_tung.Service.HoaDon.HoaDonChiTietServie;
    import com.example.sd_36_datn_tung.Service.HoaDon.HoaDonService;
    import com.example.sd_36_datn_tung.Service.KhachHang.KhachHangService;
    import com.example.sd_36_datn_tung.Service.SanPham.MauSacService;
    import com.example.sd_36_datn_tung.Service.SanPham.SizeService;
    import jakarta.servlet.http.HttpSession;
    import org.springframework.beans.factory.annotation.Autowired;
    import org.springframework.web.bind.annotation.*;

    import java.math.BigDecimal;
    import java.util.List;
    import java.util.UUID;

    @RestController
    @RequestMapping("api")
    public class BanHangTaiQuayAPIController {
        @Autowired
        private HoaDonChiTietServie hoaDonChiTietservie;

        @Autowired
        private HoaDonService hdService;

        @Autowired
        private KhachHangService khService;

        @Autowired
        private GiayTheThaoChiTietService gttctService;

        @Autowired
        private MauSacService msService;

        @Autowired
        private SizeService sizeService;

        @Autowired
        private GiayTheThaoService gttService;

        @Autowired
        private ChuongTrinhGiamGiaHoaDonService ctggHDService;

        @Autowired
        private ChuongTrinhGiamGiaChiTietGiayTheThaoService ctggctService;

        @Autowired
        private ChuongTrinhGiamGiaChiTietHoaDonService ctggcthdService;
//sanpham
        @GetMapping("/gtt")
        private List<GiayTheThao> getAllGtt() {
            return gttService.getAll();
        }
//mausac
        @GetMapping("/gttct/mauSac/{idGtt}")
        public List<MauSac> getAllMauSacByIdGtt(@PathVariable("idGtt") UUID idGtt) {
            System.out.println(msService.getAllByIdGtt(idGtt).size());
            return msService.getAllByIdGtt(idGtt);
        }
//sizze
        @GetMapping("/gttct/size/{idGtt}")
        public List<Size> getAllSizeByIdGtt(@PathVariable("idGtt") UUID idGtt) {
            return sizeService.getAllByIdGtt(idGtt);
        }
//
        @PostMapping("/gttct/{idGtt}")
        public GiayTheThaoChiTiet getGttctByGttAndMauSacAndSize(@PathVariable("idGtt") UUID idGtt, @RequestBody String[] mauSacAndSize) {
            UUID idMs = UUID.fromString(mauSacAndSize[0]);
            UUID idSize = UUID.fromString(mauSacAndSize[1]);
            GiayTheThaoChiTiet gttct = gttctService.getByGttMsSize(idGtt, idMs, idSize);
            if (gttct == null) {
                GiayTheThaoChiTiet newGttct = new GiayTheThaoChiTiet();
                newGttct.setSoLuong("0");
                return newGttct;
            }
            return gttct;
        }
//check
        @GetMapping("/gtt/checkCount")
        public int checkCount() {
            return gttService.countGttInCtgg();
        }
////app chuong trinh giam gia theo san pham
        @GetMapping("/ctggct/{idGtt}")
        public ChuongTrinhGiamGiaChiTietGiayTheThao getCtggByIdGtt(@PathVariable("idGtt") UUID idGtt) {
            GiayTheThao gtt = gttService.getOne(idGtt);
            return ctggctService.getByGiayTheThao(gtt);
        }
//lấy ra tất cả các list sPCT
        @GetMapping("/gttct")
        private List<GiayTheThaoChiTiet> getAllGttct() {
            return gttctService.getAll();
        }
//tìm kiếm tất cả các sản phẩm giày thể thao
        @PostMapping("/gttct/search")
        private List<GiayTheThao> searchByName(@RequestBody String[] name) {
            // System.out.println("Name: " + name);
            List<GiayTheThao> result = gttService.findGiayTheThao(name[0]);
            // System.out.println("GTTCT: "+result.get(0).getGiayTheThao().
            // getTenGiayTheThao());
            return result;
        }
//hiện list các khachs hàng để chọn khi thêm hóa đơn
        @PostMapping("/kh/search")
        private List<KhachHang> searchByTen(@RequestBody String[] name) {
            // System.out.println("Name: " + name);
            List<KhachHang> result = khService.findKhachHang(name[0]);
            // System.out.println(": "+result.get(0).getGiayTheThao().getTenGiayTheThao());
            return result;
        }
//        hiện list các khachs hàng để chọn khi thêm hóa đơn
//        hien list khach hang
        @GetMapping("/kh")
        public List<KhachHang> getAllKH() {
            return khService.getAll();
        }
        //hien tat ca cac id cua hdct
        @GetMapping("/hdct/{id}")
        public List<HoaDonChiTiet> getAllHDCTByid(@PathVariable("id") UUID id) {
            return hoaDonChiTietservie.getListByID(id);
        }

        @PutMapping("hdct/{id}")
        public HoaDonChiTiet putHDCTByid(@PathVariable("id") UUID id, @RequestBody int soLuong) {
            return hoaDonChiTietservie.updateHDCT(soLuong, id);
        }

        @DeleteMapping("/hdct/{id}")
        public void deleteHDCTByid(@PathVariable("id") UUID id) {
            hoaDonChiTietservie.removeHDCTByID(id);
        }

        @GetMapping("/hd/unpaid")
        public List<HoaDon> getAllHDC() {

            return hdService.hoaDonCho();

        }

        @DeleteMapping("/hd/{id}")
        public void removeHDCByID(@PathVariable("id") UUID id) {

            hdService.removeHDCByID(id);

        }

        @PostMapping("/hdct")
        public HoaDonChiTiet addHDCT(@RequestBody HoaDonChiTiet hdct) {

            return hoaDonChiTietservie.addHDCT(hdct);
        }

        @PostMapping("/hdct/check/{id}")
        public boolean check(@PathVariable("id") UUID id, @RequestBody int soLuong) {
            return hoaDonChiTietservie.checkSoLuongGTTCT(id, soLuong);
        }

        @PostMapping("/hd")
        public HoaDon createHoaDon(@RequestBody String[] strings, HttpSession session) {
            HoaDon hd = new HoaDon();

            UUID idUser = (UUID) session.getAttribute("idUser");
            User user = new User();
            user.setId(idUser);
            hd.setUser(user);

            if (strings[1].length() != 0) {
                UUID idKH = UUID.fromString(strings[1]);
                KhachHang kh = new KhachHang();
                kh.setId(idKH);
                hd.setKhachHang(kh);
            }

            return hdService.createHD(hd);
        }

        @PostMapping("/hd/pay/{id}")
        public String pay(@PathVariable("id") UUID id, @RequestBody String[] tt) {
            return hdService.thanhToan(id, tt);
        }

        @GetMapping("/hd/{id}")
        public HoaDon Hd(@PathVariable("id") UUID id) {
            return hdService.findId(id);
        }
//chuong trình giảm giá theo hóa đơn
        @PostMapping("/ctgg")
        public List<ChuongTrinhGiamGiaHoaDon> getAllChuongTrinhGiamGiaHoaDon(@RequestBody String[] list) {
            String sl = list[0];
            BigDecimal tt = new BigDecimal(list[0]);
            return ctggHDService.getAllBySlTT(sl, tt);
        }
//lấy ra tất cả các id của hóa đơn trong quá trình thêm giảm giá
        @GetMapping("/ctgg/{id}")
        public ChuongTrinhGiamGiaHoaDon getCtggHDByID(@PathVariable("id") UUID id) {
            return ctggHDService.getOne(id);
        }
//hiện thị và tính toán
        @PostMapping("/ctgg/create/{idHD}")
        public ChuongTrinhGiamGiaChiTietHoaDon createCtgghd(@PathVariable("idHD") UUID idHD, @RequestBody String[] array) {
            UUID idCtgghd = UUID.fromString(array[0]);
            BigDecimal tt = new BigDecimal(array[1]);
            return ctggcthdService.createCTGGChiTietHoaDon(idCtgghd, idHD, tt);
        }
    }
