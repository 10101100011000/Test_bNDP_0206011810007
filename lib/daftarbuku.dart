part of 'page.dart';

class DaftarBuku extends StatefulWidget {
  @override
  State<DaftarBuku> createState() => _DaftarBukuState();
}

class _DaftarBukuState extends State<DaftarBuku> {
  Future getDataBuku() async {
    var url = 'http://192.168.0.104/bnsptest/readData.php';
    var response = await http.get(url);
    var pdfText= await json.decode(json.encode(response.body)); 
  List data = json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(
              child: Text(
            "List Buku",
            style: TextStyle(color: Colors.black),
          )),
          backgroundColor: Colors.white,
        ),
        body: FutureBuilder(
            future: getDataBuku(),
            builder: (context, snapshot) {
              if (snapshot.hasError) print(snapshot.error);
              return snapshot.hasData
                  ? ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, index) {
                        List list = snapshot.data;
                        return Card(
                          child: ListTile(
                            contentPadding: EdgeInsets.all(10),
                            onTap: () {},
                            title: Text(list[index]['judul_buku'],
                                style: TextStyle(
                                    fontSize: 18, fontFamily: 'saira')),
                            leading: CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 25,
                            ),
                          ),
                        );
                      })
                  : Center(
                      child: CircularProgressIndicator(),
                    );
            }));
  }
}
