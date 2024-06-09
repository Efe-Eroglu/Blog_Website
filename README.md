# <p align="center" Kişisel Blog Sitesi </p>

Bu proje, kullanıcıların blog yazılarını okuyabileceği ve yorum yapabileceği, admin paneli üzerinden ise kategori, blog ve yorum gibi içerikleri ekleyip, güncelleyip, silebileceği bir kişisel blog sitesidir.
<br>
<br>

# Özellikler

### Admin Paneli
- **Kategori Yönetimi**: Kategoriler eklenebilir, güncellenebilir ve silinebilir.
- **Blog Yönetimi**: Blog yazıları eklenebilir, güncellenebilir ve silinebilir.
- **Yorum Yönetimi**: Yorumlar yönetilebilir, istenirse silinebilir.
- **Duyuru Yönetimi**: Duyuru yazıları eklenebilir, güncellenebilir ve silinebilir.

### Kullanıcı Arayüzü
- **Blog Yazılarını Okuma**: Kullanıcılar blog yazılarını okuyabilir.
- **Yorum Yapma**: Kullanıcılar blog yazılarına yorum yapabilir.
- **Hesap Oluşturma**: Kullanıcılar giriş yapmadan veya kayıt olmadan blog yazılarına erişemezler.





# Uygulama İçi Görüntüler

## Kullanıcı Paneli
1-) Ana Sayfa

![anasayfa](https://github.com/Efe-Eroglu/Blog_Website/assets/95614657/2d74ea3d-a95a-455f-8f8c-a846f9b5b5a1)

2-) Giriş yapma

![login](https://github.com/Efe-Eroglu/Blog_Website/assets/95614657/f1f6bf4e-1d38-4b02-aa69-ea0f5e5ed85f)

3-) Bloglar

![bloglar](https://github.com/Efe-Eroglu/Blog_Website/assets/95614657/a6efe425-090a-4248-b1eb-93144a214973)

3-) Blog Detay

![blogDetay](https://github.com/Efe-Eroglu/Blog_Website/assets/95614657/d77fcda3-faa7-4c99-8876-76a127eec37f)

4-) Yorumlar

![yorum](https://github.com/Efe-Eroglu/Blog_Website/assets/95614657/af55ba49-a4ed-4a53-9e26-7180f9c35801)

## Admin Panel

1-) Dashboard

![admin](https://github.com/Efe-Eroglu/Blog_Website/assets/95614657/6fa4420a-0b57-46bc-9446-a131aa9335c1)


2-) Düzenleme İşlemleri

![adminPanel](https://github.com/Efe-Eroglu/Blog_Website/assets/95614657/9dbc3fe9-0770-49c7-bd74-fbd6f7fde9fe)
<br>
![panel3](https://github.com/Efe-Eroglu/Blog_Website/assets/95614657/c8c954a8-23f2-43f2-9aa3-92eff791145f)



# Kurulum

### Gereksinimler
- [Visual Studio 2019+](https://visualstudio.microsoft.com/)
- [SQL Server](https://www.microsoft.com/en-us/sql-server/sql-server-downloads)

  
### Adımlar

1. **Projeyi Klonlayın**

    ```bash
    git clone https://github.com/Efe-Eroglu/Blog_Website.git
    cd ./BlogProjem
    ```

2. **Visual Studio'da Projeyi Açın**

    - `BlogProjem.sln` dosyasını Visual Studio'da açın.

3. **Veritabanını Düzenle**


```bash
    SqlConnection baglanti = new SqlConnection("Data Source=your_database_name; Initial Catalog=Blog; Integrated Security=true");
```

5. **Uygulamayı Başlatın**

    - F5 tuşuna basarak veya `IIS Express` butonuna tıklayarak projeyi çalıştırın.

6. **Tarayıcınızda Açın**

    - Uygulamanız [https://localhost:44333](https://localhost:44333)

      
# Kullanım

### Admin Paneline Erişim

- Admin paneline erişmek için `/admin` yolunu kullanabilirsiniz. Buradan kategori, duyuru, blog ve yorum yönetimi işlemlerini gerçekleştirebilirsiniz.

### Kullanıcı Arayüzü

- Anasayfada tüm blog yazılarını görebilir, herhangi bir blog yazısına tıklayarak detaylıca okuyabilir ve yorum yapabilirsiniz.


## Katkıda Bulunma

Katkıda bulunmak isterseniz, lütfen önce bir [issue]([https://github.com/kullanici-adi/blog-projesi/issues](https://github.com/Efe-Eroglu/Blog_Website.git)) açın. Pull request'ler memnuniyetle karşılanır.

