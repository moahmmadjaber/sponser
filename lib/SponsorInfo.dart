class SponsorInfo {
  SponsorInfo({
    required this.benfSTATUSID,
    required this.noTYPEARROGANT,
    required this.noTYPENORMAL,
    required this.noTYPEMUTAFAWIQIN,
    required this.totalPERSONAMOUNT,
    required this.noTYPEAHTIAJAT,
    required this.totalNOOTHERTYPE,
    required this.totalNOOTHERTYPEAMOUNT,
    required this.governementNAME,
    required this.beneficentOLDNO,
    required this.beneficentname,
    required this.noTYPEMEDICINE,
    required this.noTYPEFOUNDATIONWARRANTY,
    required this.noTYPEELECTRICITY,
    required this.noTYPEFAMILYAMOUNT,
    required this.totalAMOUNT,
    required this.officeNAME,
    required this.beneficentID,
    required this.totalPERSON,
    required this.finalACCOUNT,
    required this.noTYPEHASHD,
    required this.noTYPEWIDOW,
    required this.noTYPERENT,
    required this.branchNAME,
    required this.benfSTATUS,
    required this.startDATE,
    required this.countryNAME,
    required this.beneficentNO,
    required this.paidAMOUNTS,
    this.stopDATE,
  });
  late final int benfSTATUSID;
  late final int noTYPEARROGANT;
  late final int noTYPENORMAL;
  late final int noTYPEMUTAFAWIQIN;
  late final int totalPERSONAMOUNT;
  late final int noTYPEAHTIAJAT;
  late final int totalNOOTHERTYPE;
  late final int totalNOOTHERTYPEAMOUNT;
  late final String governementNAME;
  late final String beneficentOLDNO;
  late final String beneficentname;
  late final int noTYPEMEDICINE;
  late final int noTYPEFOUNDATIONWARRANTY;
  late final int noTYPEELECTRICITY;
  late final int noTYPEFAMILYAMOUNT;
  late final int totalAMOUNT;
  late final String officeNAME;
  late final int beneficentID;
  late final int totalPERSON;
  late final int finalACCOUNT;
  late final int noTYPEHASHD;
  late final int noTYPEWIDOW;
  late final int noTYPERENT;
  late final String branchNAME;
  late final String benfSTATUS;
  late final String startDATE;
  late final String countryNAME;
  late final String beneficentNO;
  late final int paidAMOUNTS;
  late final Null stopDATE;

  SponsorInfo.fromJson(Map<String, dynamic> json){
    benfSTATUSID = json['benf_STATUS_ID'];
    noTYPEARROGANT = json['no_TYPE_ARROGANT'];
    noTYPENORMAL = json['no_TYPE_NORMAL'];
    noTYPEMUTAFAWIQIN = json['no_TYPE_MUTAFAWIQIN'];
    totalPERSONAMOUNT = json['total_PERSON_AMOUNT'];
    noTYPEAHTIAJAT = json['no_TYPE_AHTIAJAT'];
    totalNOOTHERTYPE = json['total_NO_OTHER_TYPE'];
    totalNOOTHERTYPEAMOUNT = json['total_NO_OTHER_TYPE_AMOUNT'];
    governementNAME = json['governement_NAME'];
    beneficentOLDNO = json['beneficent_OLD_NO'];
    beneficentname = json['beneficentname'];
    noTYPEMEDICINE = json['no_TYPE_MEDICINE'];
    noTYPEFOUNDATIONWARRANTY = json['no_TYPE_FOUNDATION_WARRANTY'];
    noTYPEELECTRICITY = json['no_TYPE_ELECTRICITY'];
    noTYPEFAMILYAMOUNT = json['no_TYPE_FAMILY_AMOUNT'];
    totalAMOUNT = json['total_AMOUNT'];
    officeNAME = json['office_NAME'];
    beneficentID = json['beneficent_ID'];
    totalPERSON = json['total_PERSON'];
    finalACCOUNT = json['final_ACCOUNT'];
    noTYPEHASHD = json['no_TYPE_HASHD'];
    noTYPEWIDOW = json['no_TYPE_WIDOW'];
    noTYPERENT = json['no_TYPE_RENT'];
    branchNAME = json['branch_NAME'];
    benfSTATUS = json['benf_STATUS'];
    startDATE = json['start_DATE'];
    countryNAME = json['country_NAME'];
    beneficentNO = json['beneficent_NO'];
    paidAMOUNTS = json['paid_AMOUNTS'];
    stopDATE = null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['benf_STATUS_ID'] = benfSTATUSID;
    _data['no_TYPE_ARROGANT'] = noTYPEARROGANT;
    _data['no_TYPE_NORMAL'] = noTYPENORMAL;
    _data['no_TYPE_MUTAFAWIQIN'] = noTYPEMUTAFAWIQIN;
    _data['total_PERSON_AMOUNT'] = totalPERSONAMOUNT;
    _data['no_TYPE_AHTIAJAT'] = noTYPEAHTIAJAT;
    _data['total_NO_OTHER_TYPE'] = totalNOOTHERTYPE;
    _data['total_NO_OTHER_TYPE_AMOUNT'] = totalNOOTHERTYPEAMOUNT;
    _data['governement_NAME'] = governementNAME;
    _data['beneficent_OLD_NO'] = beneficentOLDNO;
    _data['beneficentname'] = beneficentname;
    _data['no_TYPE_MEDICINE'] = noTYPEMEDICINE;
    _data['no_TYPE_FOUNDATION_WARRANTY'] = noTYPEFOUNDATIONWARRANTY;
    _data['no_TYPE_ELECTRICITY'] = noTYPEELECTRICITY;
    _data['no_TYPE_FAMILY_AMOUNT'] = noTYPEFAMILYAMOUNT;
    _data['total_AMOUNT'] = totalAMOUNT;
    _data['office_NAME'] = officeNAME;
    _data['beneficent_ID'] = beneficentID;
    _data['total_PERSON'] = totalPERSON;
    _data['final_ACCOUNT'] = finalACCOUNT;
    _data['no_TYPE_HASHD'] = noTYPEHASHD;
    _data['no_TYPE_WIDOW'] = noTYPEWIDOW;
    _data['no_TYPE_RENT'] = noTYPERENT;
    _data['branch_NAME'] = branchNAME;
    _data['benf_STATUS'] = benfSTATUS;
    _data['start_DATE'] = startDATE;
    _data['country_NAME'] = countryNAME;
    _data['beneficent_NO'] = beneficentNO;
    _data['paid_AMOUNTS'] = paidAMOUNTS;
    _data['stop_DATE'] = stopDATE;
    return _data;
  }
}