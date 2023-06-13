// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'actiontrak_api_error.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActionTRAKApiError _$ActionTRAKApiErrorFromJson(Map<String, dynamic> json) =>
    ActionTRAKApiError(
      code: $enumDecodeNullable(_$ActionTRAKApiErrorCodeEnumMap, json['code']),
      message: json['message'] as String?,
      parameter: json['parameter'] as String?,
      data: json['data'] == null
          ? null
          : ApiErrorDataDto.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ActionTRAKApiErrorToJson(ActionTRAKApiError instance) =>
    <String, dynamic>{
      'code': _$ActionTRAKApiErrorCodeEnumMap[instance.code],
      'message': instance.message,
      'parameter': instance.parameter,
      'data': instance.data,
    };

const _$ActionTRAKApiErrorCodeEnumMap = {
  ActionTRAKApiErrorCode.api000: 'API000',
  ActionTRAKApiErrorCode.api001: 'API001',
  ActionTRAKApiErrorCode.api002: 'API002',
  ActionTRAKApiErrorCode.api003: 'API003',
  ActionTRAKApiErrorCode.api004: 'API004',
  ActionTRAKApiErrorCode.api005: 'API005',
  ActionTRAKApiErrorCode.api006: 'API006',
  ActionTRAKApiErrorCode.api007: 'API007',
  ActionTRAKApiErrorCode.api008: 'API008',
  ActionTRAKApiErrorCode.api009: 'API009',
  ActionTRAKApiErrorCode.api010: 'API010',
  ActionTRAKApiErrorCode.api011: 'API011',
  ActionTRAKApiErrorCode.api012: 'API012',
  ActionTRAKApiErrorCode.api013: 'API013',
  ActionTRAKApiErrorCode.api014: 'API014',
  ActionTRAKApiErrorCode.api015: 'API015',
  ActionTRAKApiErrorCode.api016: 'API016',
  ActionTRAKApiErrorCode.api017: 'API017',
  ActionTRAKApiErrorCode.api018: 'API018',
  ActionTRAKApiErrorCode.api019: 'API019',
  ActionTRAKApiErrorCode.api020: 'API020',
  ActionTRAKApiErrorCode.api021: 'API021',
  ActionTRAKApiErrorCode.api022: 'API022',
  ActionTRAKApiErrorCode.api023: 'API023',
  ActionTRAKApiErrorCode.api024: 'API024',
  ActionTRAKApiErrorCode.api025: 'API025',
  ActionTRAKApiErrorCode.api026: 'API026',
  ActionTRAKApiErrorCode.api027: 'API027',
  ActionTRAKApiErrorCode.api028: 'API028',
  ActionTRAKApiErrorCode.api029: 'API029',
  ActionTRAKApiErrorCode.api030: 'API030',
  ActionTRAKApiErrorCode.api031: 'API031',
  ActionTRAKApiErrorCode.api032: 'API032',
  ActionTRAKApiErrorCode.api033: 'API033',
  ActionTRAKApiErrorCode.api034: 'API034',
  ActionTRAKApiErrorCode.api035: 'API035',
  ActionTRAKApiErrorCode.api036: 'API036',
  ActionTRAKApiErrorCode.api037: 'API037',
  ActionTRAKApiErrorCode.api038: 'API038',
  ActionTRAKApiErrorCode.api039: 'API039',
  ActionTRAKApiErrorCode.api040: 'API040',
  ActionTRAKApiErrorCode.api041: 'API041',
  ActionTRAKApiErrorCode.api042: 'API042',
  ActionTRAKApiErrorCode.api043: 'API043',
  ActionTRAKApiErrorCode.api044: 'API044',
  ActionTRAKApiErrorCode.api045: 'API045',
  ActionTRAKApiErrorCode.api046: 'API046',
  ActionTRAKApiErrorCode.api047: 'API047',
  ActionTRAKApiErrorCode.api048: 'API048',
  ActionTRAKApiErrorCode.api049: 'API049',
  ActionTRAKApiErrorCode.api050: 'API050',
  ActionTRAKApiErrorCode.api051: 'API051',
  ActionTRAKApiErrorCode.api052: 'API052',
  ActionTRAKApiErrorCode.api053: 'API053',
  ActionTRAKApiErrorCode.api054: 'API054',
  ActionTRAKApiErrorCode.api055: 'API055',
  ActionTRAKApiErrorCode.api056: 'API056',
  ActionTRAKApiErrorCode.api057: 'API057',
  ActionTRAKApiErrorCode.api058: 'API058',
  ActionTRAKApiErrorCode.api059: 'API059',
  ActionTRAKApiErrorCode.api060: 'API060',
  ActionTRAKApiErrorCode.api061: 'API061',
  ActionTRAKApiErrorCode.api062: 'API062',
  ActionTRAKApiErrorCode.api063: 'API063',
  ActionTRAKApiErrorCode.api064: 'API064',
  ActionTRAKApiErrorCode.api065: 'API065',
  ActionTRAKApiErrorCode.api066: 'API066',
  ActionTRAKApiErrorCode.api067: 'API067',
  ActionTRAKApiErrorCode.api068: 'API068',
  ActionTRAKApiErrorCode.api069: 'API069',
  ActionTRAKApiErrorCode.api070: 'API070',
  ActionTRAKApiErrorCode.api071: 'API071',
  ActionTRAKApiErrorCode.api072: 'API072',
  ActionTRAKApiErrorCode.api073: 'API073',
  ActionTRAKApiErrorCode.api074: 'API074',
  ActionTRAKApiErrorCode.api075: 'API075',
  ActionTRAKApiErrorCode.api076: 'API076',
  ActionTRAKApiErrorCode.api077: 'API077',
  ActionTRAKApiErrorCode.api078: 'API078',
  ActionTRAKApiErrorCode.api079: 'API079',
  ActionTRAKApiErrorCode.api080: 'API080',
  ActionTRAKApiErrorCode.api081: 'API081',
  ActionTRAKApiErrorCode.api082: 'API082',
  ActionTRAKApiErrorCode.api083: 'API083',
  ActionTRAKApiErrorCode.api084: 'API084',
  ActionTRAKApiErrorCode.api085: 'API085',
  ActionTRAKApiErrorCode.api086: 'API086',
  ActionTRAKApiErrorCode.api087: 'API087',
  ActionTRAKApiErrorCode.api088: 'API088',
  ActionTRAKApiErrorCode.api089: 'API089',
  ActionTRAKApiErrorCode.api090: 'API090',
  ActionTRAKApiErrorCode.api091: 'API091',
  ActionTRAKApiErrorCode.api092: 'API092',
  ActionTRAKApiErrorCode.api093: 'API093',
  ActionTRAKApiErrorCode.api094: 'API094',
  ActionTRAKApiErrorCode.api095: 'API095',
  ActionTRAKApiErrorCode.api096: 'API096',
  ActionTRAKApiErrorCode.api097: 'API097',
  ActionTRAKApiErrorCode.api098: 'API098',
  ActionTRAKApiErrorCode.api099: 'API099',
  ActionTRAKApiErrorCode.api100: 'API100',
  ActionTRAKApiErrorCode.api101: 'API101',
  ActionTRAKApiErrorCode.api102: 'API102',
  ActionTRAKApiErrorCode.api103: 'API103',
  ActionTRAKApiErrorCode.api104: 'API104',
  ActionTRAKApiErrorCode.api105: 'API105',
  ActionTRAKApiErrorCode.api106: 'API106',
  ActionTRAKApiErrorCode.api107: 'API107',
  ActionTRAKApiErrorCode.api108: 'API108',
  ActionTRAKApiErrorCode.api109: 'API109',
  ActionTRAKApiErrorCode.api110: 'API110',
  ActionTRAKApiErrorCode.api111: 'API111',
  ActionTRAKApiErrorCode.api112: 'API112',
  ActionTRAKApiErrorCode.api113: 'API113',
  ActionTRAKApiErrorCode.api114: 'API114',
  ActionTRAKApiErrorCode.api115: 'API115',
  ActionTRAKApiErrorCode.api116: 'API116',
  ActionTRAKApiErrorCode.api117: 'API117',
  ActionTRAKApiErrorCode.api118: 'API118',
  ActionTRAKApiErrorCode.api119: 'API119',
  ActionTRAKApiErrorCode.api120: 'API120',
  ActionTRAKApiErrorCode.api121: 'API121',
  ActionTRAKApiErrorCode.api122: 'API122',
  ActionTRAKApiErrorCode.api123: 'API123',
  ActionTRAKApiErrorCode.api124: 'API124',
  ActionTRAKApiErrorCode.api125: 'API125',
  ActionTRAKApiErrorCode.api126: 'API126',
  ActionTRAKApiErrorCode.api127: 'API127',
  ActionTRAKApiErrorCode.api128: 'API128',
  ActionTRAKApiErrorCode.api129: 'API129',
  ActionTRAKApiErrorCode.api130: 'API130',
  ActionTRAKApiErrorCode.api131: 'API131',
  ActionTRAKApiErrorCode.api132: 'API132',
  ActionTRAKApiErrorCode.api133: 'API133',
  ActionTRAKApiErrorCode.api134: 'API134',
  ActionTRAKApiErrorCode.api135: 'API135',
  ActionTRAKApiErrorCode.api136: 'API136',
  ActionTRAKApiErrorCode.api137: 'API137',
  ActionTRAKApiErrorCode.api138: 'API138',
  ActionTRAKApiErrorCode.api139: 'API139',
  ActionTRAKApiErrorCode.api141: 'API141',
  ActionTRAKApiErrorCode.api142: 'API142',
  ActionTRAKApiErrorCode.api143: 'API143',
  ActionTRAKApiErrorCode.api144: 'API144',
  ActionTRAKApiErrorCode.api145: 'API145',
  ActionTRAKApiErrorCode.api146: 'API146',
  ActionTRAKApiErrorCode.api147: 'API147',
  ActionTRAKApiErrorCode.api148: 'API148',
  ActionTRAKApiErrorCode.api149: 'API149',
  ActionTRAKApiErrorCode.api150: 'API150',
  ActionTRAKApiErrorCode.api151: 'API151',
  ActionTRAKApiErrorCode.api152: 'API152',
  ActionTRAKApiErrorCode.api155: 'API155',
  ActionTRAKApiErrorCode.api156: 'API156',
  ActionTRAKApiErrorCode.api177: 'API177',
  ActionTRAKApiErrorCode.api178: 'API178',
  ActionTRAKApiErrorCode.api179: 'API179',
  ActionTRAKApiErrorCode.api180: 'API180',
  ActionTRAKApiErrorCode.api181: 'API181',
  ActionTRAKApiErrorCode.api182: 'API182',
  ActionTRAKApiErrorCode.api183: 'API183',
  ActionTRAKApiErrorCode.api184: 'API184',
  ActionTRAKApiErrorCode.api185: 'API185',
  ActionTRAKApiErrorCode.api186: 'API186',
  ActionTRAKApiErrorCode.api187: 'API187',
  ActionTRAKApiErrorCode.api188: 'API188',
  ActionTRAKApiErrorCode.api189: 'API189',
  ActionTRAKApiErrorCode.api190: 'API190',
  ActionTRAKApiErrorCode.api191: 'API191',
  ActionTRAKApiErrorCode.api192: 'API192',
  ActionTRAKApiErrorCode.api193: 'API193',
  ActionTRAKApiErrorCode.api194: 'API194',
  ActionTRAKApiErrorCode.api195: 'API195',
  ActionTRAKApiErrorCode.api196: 'API196',
  ActionTRAKApiErrorCode.api197: 'API197',
  ActionTRAKApiErrorCode.api198: 'API198',
  ActionTRAKApiErrorCode.api199: 'API199',
  ActionTRAKApiErrorCode.api202: 'API202',
  ActionTRAKApiErrorCode.api205: 'API205',
  ActionTRAKApiErrorCode.api206: 'API206',
  ActionTRAKApiErrorCode.api219: 'API219',
  ActionTRAKApiErrorCode.api220: 'API220',
  ActionTRAKApiErrorCode.api225: 'API225',
  ActionTRAKApiErrorCode.api226: 'API226',
  ActionTRAKApiErrorCode.api227: 'API227',
  ActionTRAKApiErrorCode.api228: 'API228',
  ActionTRAKApiErrorCode.api94: 'API94',
  ActionTRAKApiErrorCode.api224: 'API224',
  ActionTRAKApiErrorCode.api426: 'API426',
  ActionTRAKApiErrorCode.connectionErrorOnAutoAction:
      'CONNECTION_ERROR_ON_AUTO_ACTION',
  ActionTRAKApiErrorCode.connectionErrorOnDemandAction:
      'CONNECTION_ERROR_ON_DEMAND_ACTION',
  ActionTRAKApiErrorCode.timeoutErrorOnDemandAction:
      'TIMEOUT_ERROR_ON_DEMAND_ACTION',
  ActionTRAKApiErrorCode.timeoutErrorOnAutoAction:
      'TIMEOUT_ERROR_ON_AUTO_ACTION',
  ActionTRAKApiErrorCode.limitedConnectionErrorOnDemandAction:
      'LIMITED_CONNECTION_ERROR_ON_DEMAND_ACTION',
  ActionTRAKApiErrorCode.limitedConnectionErrorOnAutoAction:
      'LIMITED_CONNECTION_ERROR_ON_AUTO_ACTION',
};
